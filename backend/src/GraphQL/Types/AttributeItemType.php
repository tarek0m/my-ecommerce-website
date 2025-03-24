<?php

declare(strict_types=1);

namespace MyStore\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;
use MyStore\Entity\AttributeItem;
use MyStore\Database\ConnectionFactory;
use MyStore\Repository\AttributeSetRepository;

class AttributeItemType extends ObjectType
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
      'name' => 'AttributeItem',
      'description' => 'Represents an individual attribute item that can be assigned to products',
      'fields' => [
        'id' => [
          'type' => Type::nonNull(Type::int()),
          'description' => 'The unique identifier of the attribute item',
          'resolve' => fn(AttributeItem $attributeItem) => $attributeItem->getId()
        ],
        'attribute_set_name' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The name of the attribute set this item belongs to',
          'resolve' => function (AttributeItem $attributeItem) {
            $attributeSetRepository = new AttributeSetRepository(ConnectionFactory::getConnection());
            $attributeSet = $attributeSetRepository->findById($attributeItem->getAttributeSetId());
            return $attributeSet->getName();
          }
        ],
        'display_value' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The display value of the attribute',
          'resolve' => fn(AttributeItem $attributeItem) => $attributeItem->getDisplayValue()
        ],
        'value' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The actual value of the attribute',
          'resolve' => fn(AttributeItem $attributeItem) => $attributeItem->getValue()
        ],
        'attributeId' => [
          'type' => Type::nonNull(Type::string()),
          'description' => 'The identifier for the attribute',
          'resolve' => fn(AttributeItem $attributeItem) => $attributeItem->getAttributeId()
        ]
      ]
    ]);
  }
}
