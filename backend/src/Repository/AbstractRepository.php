<?php

declare(strict_types=1);

namespace MyStore\Repository;

use PDO;

abstract class AbstractRepository
{
    protected PDO $connection;
    protected string $table;
    protected string $entityClass;

    public function __construct(PDO $connection)
    {
        $this->connection = $connection;
    }

    /**
     * Find an entity by its ID
     * 
     * @param int|string $id
     * @return object|null
     */
    protected function doFindById($id): ?object
    {
        $stmt = $this->connection->prepare("SELECT * FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$data) {
            return null;
        }

        $entity = new $this->entityClass();
        return $entity->fromArray($data);
    }

    /**
     * Find all entities
     * 
     * @return array
     */
    protected function doFindAll(): array
    {
        $stmt = $this->connection->prepare("SELECT * FROM {$this->table}");
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $entities = [];
        foreach ($data as $row) {
            $entity = new $this->entityClass();
            $entities[] = $entity->fromArray($row);
        }

        return $entities;
    }

    /**
     * Save an entity
     * 
     * @param object $entity
     * @return object
     */
    protected function doSave(object $entity): object
    {
        $data = $entity->toArray();
        $fields = array_keys($data);
        $values = array_values($data);
        $placeholders = array_fill(0, count($fields), '?');

        $sql = sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            $this->table,
            implode(', ', $fields),
            implode(', ', $placeholders)
        );

        $stmt = $this->connection->prepare($sql);
        $stmt->execute($values);
        
        // Get the last insert ID and set it on the entity
        $lastInsertId = (int) $this->connection->lastInsertId();
        $entity->setId($lastInsertId);

        return $entity;
    }
}
