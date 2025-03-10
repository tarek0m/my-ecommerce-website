<?php

declare(strict_types=1);

namespace MyStore\Repository;

interface ReadOnlyRepositoryInterface
{
    /**
     * Find an entity by its ID
     * 
     * @param int|string $id
     * @return object|null
     */
    public function findById($id): ?object;

    /**
     * Find all entities
     * 
     * @return array
     */
    public function findAll(): array;
}