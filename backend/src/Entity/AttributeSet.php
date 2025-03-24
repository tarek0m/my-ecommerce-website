<?php

declare(strict_types=1);

namespace MyStore\Entity;

/**
 * AttributeSet Entity
 * 
 * @property int $id Unique identifier for the attribute set
 * @property string $name Name of the attribute set
 * @property string $type Type of the attribute set
 */
class AttributeSet extends AbstractEntity
{
  public function getId(): int
  {
    return (int)$this->data['id'];
  }

  public function getName(): string
  {
    return $this->data['name'];
  }

  public function getType(): string
  {
    return $this->data['type'];
  }

  public function setId(int $id): self
  {
    $this->data['id'] = $id;
    return $this;
  }

  public function setName(string $name): self
  {
    $this->data['name'] = $name;
    return $this;
  }

  public function setType(string $type): self
  {
    $this->data['type'] = $type;
    return $this;
  }
}
