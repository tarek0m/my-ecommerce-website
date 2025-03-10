<?php

declare(strict_types=1);

namespace MyStore\Entity;

/**
 * Category Entity
 * 
 * @property int $id Unique identifier for the category
 * @property string $name Category name
 */
class Category extends AbstractEntity
{
    public function getId(): int
    {
        return (int)$this->data['id'];
    }

    public function getName(): string
    {
        return $this->data['name'];
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
}
