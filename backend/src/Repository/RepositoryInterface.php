<?php

declare(strict_types=1);

namespace MyStore\Repository;

interface RepositoryInterface
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

    /**
     * Save an entity
     * 
     * @param object $entity
     * @return object
     */
    public function save(object $entity): object;
}