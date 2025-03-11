<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use MyStore\Repository\CategoryRepository;
use MyStore\Database\ConnectionFactory;

class ProductType extends ObjectType
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
      'name' => 'Product',
      'description' => 'Represents a product in the store',
      'fields' => fn() => [
        'id' => [
          'type' => Type::string(),
          'description' => 'Unique identifier of the product'
        ],
        'name' => [
          'type' => Type::string(),
          'description' => 'Name of the product'
        ],
        'description' => [
          'type' => Type::string(),
          'description' => 'Detailed description of the product'
        ],
        'category_id' => [
          'type' => Type::int(),
          'description' => 'ID of the product category',
        ],
        'inStock' => [
          'type' => Type::boolean(),
          'description' => 'Whether the product is currently in stock'
        ],
        'brand' => [
          'type' => Type::string(),
          'description' => 'Brand name of the product'
        ],
        'price' => [
          'type' => Type::float(),
          'description' => 'Current price of the product'
        ],
        'currency' => [
          'type' => Type::string(),
          'description' => 'Currency of the product price'
        ],
        'gallery' => [
          'type' => Type::string(),
          'description' => 'JSON encoded array of gallery images'
        ],
        'attributes' => [
          'type' => Type::string(),
          'description' => 'JSON encoded array of product attributes'
        ]
      ]
    ]);
  }
}
