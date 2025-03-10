<?php

declare(strict_types=1);

namespace MyStore\Repository;

use MyStore\Entity\Product;
use PDO;

class ProductRepository extends AbstractRepository implements ReadOnlyRepositoryInterface
{
    public function __construct(PDO $connection)
    {
        parent::__construct($connection);
        $this->table = 'products';
        $this->entityClass = Product::class;
    }

    public function findById($id): ?object
    {
        return $this->doFindById($id);
    }

    public function findAll(): array
    {
        return $this->doFindAll();
    }
}