<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class CategoryType extends ObjectType
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
      'name' => 'Category',
      'fields' => [
        'id' => ['type' => Type::int()],
        'name' => ['type' => Type::string()],
      ]
    ]);
  }
}
