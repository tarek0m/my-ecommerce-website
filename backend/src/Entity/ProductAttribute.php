<?php

declare(strict_types=1);

namespace MyStore\Entity;

/**
 * ProductAttribute Entity
 * 
 * @property string $product_id Foreign key to products table
 * @property int $attribute_item_id Foreign key to attribute_items table
 */
class ProductAttribute extends AbstractEntity
{
  public function getProductId(): string
  {
    return $this->data['product_id'];
  }

  public function getAttributeItemId(): int
  {
    return (int)$this->data['attribute_item_id'];
  }

  public function setProductId(string $productId): self
  {
    $this->data['product_id'] = $productId;
    return $this;
  }

  public function setAttributeItemId(int $attributeItemId): self
  {
    $this->data['attribute_item_id'] = $attributeItemId;
    return $this;
  }
}
