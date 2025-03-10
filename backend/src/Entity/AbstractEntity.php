<?php

declare(strict_types=1);

namespace MyStore\Entity;

abstract class AbstractEntity
{
    protected array $data = [];

    public function __get(string $name)
    {
        return $this->data[$name] ?? null;
    }

    public function __set(string $name, $value): void
    {
        $this->data[$name] = $value;
    }

    public function __isset(string $name): bool
    {
        return isset($this->data[$name]);
    }

    public function toArray(): array
    {
        return $this->data;
    }

    public function fromArray(array $data): self
    {
        $this->data = $data;
        return $this;
    }
}
