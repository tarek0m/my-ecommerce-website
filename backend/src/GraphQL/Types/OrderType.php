<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

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
          'type' => Type::int(),
          'description' => 'Unique identifier of the order'
        ],
        'order_date' => [
          'type' => Type::string(),
          'description' => 'Date when the order was placed'
        ],
        'total_amount' => [
          'type' => Type::float(),
          'description' => 'Total amount of the order'
        ],
        'items' => [
          'type' => Type::string(),
          'description' => 'List of items in the order'
        ]
      ]
    ]);
  }
}
