<?php

declare(strict_types=1);

namespace MyStore\Controller;

use GraphQL\GraphQL as GraphQLProcessor;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Schema;
use MyStore\GraphQL\Types\CategoryType;
use MyStore\GraphQL\Types\ProductType;
use MyStore\GraphQL\Types\OrderType;

use MyStore\Repository\CategoryRepository;
use MyStore\Repository\ProductRepository;
use MyStore\Repository\OrderRepository;
use MyStore\Database\ConnectionFactory;
use MyStore\Entity\Order;

class GraphQL
{
  private Schema $schema;

  public function __construct()
  {
    $this->schema = $this->buildSchema();
  }

  public function handle(): string
  {
    $rawInput = file_get_contents('php://input');
    $input = json_decode($rawInput, true);

    try {
      $result = GraphQLProcessor::executeQuery(
        $this->schema,
        $input['query'],
        null,
        null,
        $input['variables'] ?? null
      );
      return json_encode($result->toArray());
    } catch (\Exception $e) {
      return json_encode([
        'errors' => [[
          'message' => $e->getMessage()
        ]]
      ]);
    }
  }

  private function buildSchema(): Schema
  {
    $queryType = new ObjectType([
      'name' => 'Query',
      'fields' => [
        'categories' => [
          'type' => Type::listOf(new CategoryType()),
          'resolve' => function () {
            try {
              $repository = new CategoryRepository(ConnectionFactory::getConnection());
              return $repository->findAll();
            } catch (\PDOException $e) {
              throw new \RuntimeException('Database error while fetching categories: ' . $e->getMessage());
            } catch (\Exception $e) {
              throw new \RuntimeException('Error fetching categories: ' . $e->getMessage());
            }
          }
        ],
        'products' => [
          'type' => Type::listOf(new ProductType()),
          'resolve' => function () {
            try {
              $repository = new ProductRepository(ConnectionFactory::getConnection());
              return $repository->findAll();
            } catch (\PDOException $e) {
              throw new \RuntimeException('Database error while fetching products: ' . $e->getMessage());
            } catch (\Exception $e) {
              throw new \RuntimeException('Error fetching products: ' . $e->getMessage());
            }
          }
        ]
      ]
    ]);

    $mutationType = new ObjectType([
      'name' => 'Mutation',
      'fields' => [
        'createOrder' => [
          'type' => new OrderType(),
          'args' => [
            'items' => Type::nonNull(Type::string())
          ],
          'resolve' => function ($root, array $args) {

            $items = json_decode($args['items'], true);

            $connection = ConnectionFactory::getConnection();
            $connection->beginTransaction();

            try {
              $orderRepository = new OrderRepository($connection);
              $productRepository = new ProductRepository($connection);

              $totalAmount = 0;
              $orderItems = [];

              foreach ($items as $item) {
                $product = $productRepository->findById($item['product_id'])->toArray();
                if (!$product) {
                  throw new \RuntimeException("Product not found: {$item['product_id']}");
                }

                $unitPrice = $product['price'];
                $totalAmount += $unitPrice * $item['quantity'];

                $orderItems[] = [
                  'product_id' => $item['product_id'],
                  'quantity' => $item['quantity'],
                  'unit_price' => $unitPrice,
                  'selected_attributes' => $item['selected_attributes'] ?? null
                ];
              }

              // Create and save order with items as JSON
              $order = new Order();
              $order->setTotalAmount($totalAmount);
              $order->setItems($orderItems);
              $savedOrder = $orderRepository->save($order);

              $connection->commit();
              return $orderRepository->findById($savedOrder->getId());
            } catch (\Exception $e) {
              $connection->rollBack();
              throw $e;
            }
          }
        ]
      ]
    ]);

    return new Schema([
      'query' => $queryType,
      'mutation' => $mutationType
    ]);
  }
}
