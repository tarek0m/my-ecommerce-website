<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use MyStore\Entity\AttributeSet;

class AttributeSetType extends ObjectType
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
      'name' => 'AttributeSet',
      'description' => 'Represents a set of attributes that can be assigned to products',
      'fields' => [
        'id' => [
          'type' => Type::nonNull(Type::int()),
          'description' => 'The unique identifier of the attribute set',
          'resolve' => fn(AttributeSet $attributeSet) => $attributeSet->getId()
        ],
        'name' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The name of the attribute set',
          'resolve' => fn(AttributeSet $attributeSet) => $attributeSet->getName()
        ],
        'type' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The type of the attribute set',
          'resolve' => fn(AttributeSet $attributeSet) => $attributeSet->getType()
        ]
      ]
    ]);
  }
}
