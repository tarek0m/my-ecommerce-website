<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use MyStore\Entity\Product;
use MyStore\Database\ConnectionFactory;
use MyStore\Repository\AttributeItemRepository;
use MyStore\GraphQL\Types\AttributeItemType;

class ProductType extends ObjectType
{
  private static ?ObjectType $instance = null;

  public static function getInstance(): ObjectType
  {
    if (self::$instance === null) {
      $attributeItemType = new AttributeItemType();
      self::$instance = new static($attributeItemType);
    }
    return self::$instance;
  }

  public function __construct(AttributeItemType $attributeItemType)
  {
    parent::__construct([
      'name' => 'Product',
      'description' => 'Represents a product in the store',
      'fields' => [
        'id' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The unique identifier of the product',
        ],
        'name' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The name of the product',
        ],
        'description' => [
          'type' => Type::string(),
          'description' => 'The description of the product',
        ],
        'inStock' => [
          'type' => Type::nonNull(Type::boolean()),
          'description' => 'Whether the product is in stock',
        ],
        'category_id' => [
          'type' => Type::int(),
          'description' => 'The ID of the category this product belongs to',
          'resolve' => fn(Product $product) => $product->getCategoryId()
        ],
        'brand' => [
          'type' => Type::string(),
          'description' => 'The brand of the product',
          'resolve' => fn(Product $product) => $product->getBrand()
        ],
        'price' => [
          'type' => Type::nonNull(Type::float()),
          'description' => 'The price of the product',
          'resolve' => fn(Product $product) => $product->getPrice()
        ],
        'currency' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The currency code for the product price',
          'resolve' => fn(Product $product) => $product->getCurrency()
        ],
        'gallery' => [
          'type' => Type::listOf(Type::string()),
          'description' => 'Array of gallery image URLs',
          'resolve' => fn(Product $product) => $product->getGallery()
        ],
        'attributes' => [
          'type' => Type::listOf($attributeItemType),
          'description' => 'Product attributes',
          'resolve' => function (Product $product) {
            $attributeItemRepository = new AttributeItemRepository(ConnectionFactory::getConnection());
            return $attributeItemRepository->findByProductId($product->getId());
          }
        ]
      ]
    ]);
  }
}
