<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use MyStore\Entity\Order;

class OrderType extends ObjectType
{
  private static ?ObjectType $instance = null;

  public static function getInstance(): ObjectType
  {
    if (self::$instance === null) {
      self::$instance = new static();
    }
    return self::$instance;
  }

  public function __construct()
  {
    parent::__construct([
      'name' => 'Order',
      'description' => 'Represents a customer order',
      'fields' => fn() => [
        'id' => [
          'type' => Type::nonNull(Type::int()),
          'description' => 'Unique identifier of the order',
          'resolve' => fn(Order $order) => $order->getId()
        ],
        'order_date' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'Date when the order was placed',
          'resolve' => fn(Order $order) => $order->getOrderDate()
        ],
        'total_amount' => [
          'type' => Type::nonNull(Type::float()),
          'description' => 'Total amount of the order',
          'resolve' => fn(Order $order) => $order->getTotalAmount()
        ],
        'items' => [
          'type' => Type::listOf(Type::string()),
          'description' => 'JSON encoded array of order items with product_id, quantity, unit_price, and selected_attributes',
          'resolve' => fn(Order $order) => $order->getItems()
        ]
      ]
    ]);
  }
}
