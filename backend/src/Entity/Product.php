<?php

declare(strict_types=1);

namespace MyStore\Entity;

/**
 * Product Entity
 * 
 * @property string $id Unique identifier for the product
 * @property string $name Product name
 * @property string|null $description Product description
 * @property bool $inStock Product stock status
 * @property int|null $category_id Foreign key to categories table
 * @property string|null $brand Product brand name
 * @property float $price Product price
 * @property string $currency Currency code
 * @property string|null $gallery JSON encoded array of gallery images
 * @property string|null $attributes JSON encoded array of product attributes
 */
class Product extends AbstractEntity
{
    public function getId(): string
    {
        return $this->data['id'];
    }

    public function getName(): string
    {
        return $this->data['name'];
    }

    public function getDescription(): ?string
    {
        return $this->data['description'];
    }

    public function isInStock(): bool
    {
        return (bool)($this->data['inStock'] ?? false);
    }

    public function getCategoryId(): ?int
    {
        return $this->data['category_id'] ? (int)$this->data['category_id'] : null;
    }

    public function getBrand(): ?string
    {
        return $this->data['brand'];
    }

    public function getPrice(): float
    {
        return (float)$this->data['price'];
    }

    public function getCurrency(): string
    {
        return $this->data['currency'];
    }

    public function getGallery(): ?array
    {
        return $this->data['gallery'] ? json_decode($this->data['gallery'], true) : null;
    }

    public function getAttributes(): ?array
    {
        return $this->data['attributes'] ? json_decode($this->data['attributes'], true) : null;
    }

    public function setId(string $id): self
    {
        $this->data['id'] = $id;
        return $this;
    }

    public function setName(string $name): self
    {
        $this->data['name'] = $name;
        return $this;
    }

    public function setDescription(?string $description): self
    {
        $this->data['description'] = $description;
        return $this;
    }

    public function setInStock(bool $inStock): self
    {
        $this->data['inStock'] = $inStock;
        return $this;
    }

    public function setCategoryId(?int $categoryId): self
    {
        $this->data['category_id'] = $categoryId;
        return $this;
    }

    public function setBrand(?string $brand): self
    {
        $this->data['brand'] = $brand;
        return $this;
    }

    public function setPrice(float $price): self
    {
        $this->data['price'] = $price;
        return $this;
    }

    public function setCurrency(string $currency): self
    {
        $this->data['currency'] = $currency;
        return $this;
    }

    public function setGallery(?array $gallery): self
    {
        $this->data['gallery'] = $gallery ? json_encode($gallery) : null;
        return $this;
    }

    public function setAttributes(?array $attributes): self
    {
        $this->data['attributes'] = $attributes ? json_encode($attributes) : null;
        return $this;
    }
}
