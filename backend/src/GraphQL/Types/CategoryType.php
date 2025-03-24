<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use MyStore\Entity\Category;

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
      'description' => 'Represents a product category',
      'fields' => [
        'id' => [
          'type' => Type::nonNull(Type::int()),
          'description' => 'The unique identifier of the category',
          'resolve' => fn(Category $category) => $category->getId()
        ],
        'name' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The name of the category',
          'resolve' => fn(Category $category) => $category->getName()
        ],
      ]
    ]);
  }
}
