<?php

declare(strict_types=1);

namespace MyStore\Entity;

/**
 * AttributeItem Entity
 * 
 * @property int $id Unique identifier for the attribute item
 * @property int $attribute_set_id Foreign key to attribute_sets table
 * @property string $display_value Display value of the attribute
 * @property string $value Actual value of the attribute
 * @property string $attribute_id Identifier for the attribute
 */
class AttributeItem extends AbstractEntity
{
  public function getId(): int
  {
    return (int)$this->data['id'];
  }

  public function getAttributeSetId(): int
  {
    return (int)$this->data['attribute_set_id'];
  }

  public function getDisplayValue(): string
  {
    return $this->data['display_value'];
  }

  public function getValue(): string
  {
    return $this->data['value'];
  }

  public function getAttributeId(): string
  {
    return $this->data['attribute_id'];
  }

  public function setId(int $id): self
  {
    $this->data['id'] = $id;
    return $this;
  }

  public function setAttributeSetId(int $attributeSetId): self
  {
    $this->data['attribute_set_id'] = $attributeSetId;
    return $this;
  }

  public function setDisplayValue(string $displayValue): self
  {
    $this->data['display_value'] = $displayValue;
    return $this;
  }

  public function setValue(string $value): self
  {
    $this->data['value'] = $value;
    return $this;
  }

  public function setAttributeId(string $attributeId): self
  {
    $this->data['attribute_id'] = $attributeId;
    return $this;
  }
}
