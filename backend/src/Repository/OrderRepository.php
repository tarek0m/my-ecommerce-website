<?php

declare(strict_types=1);

namespace MyStore\Repository;

use MyStore\Entity\Order;
use PDO;

class OrderRepository extends AbstractRepository implements RepositoryInterface
{
  public function __construct(PDO $connection)
  {
    parent::__construct($connection);
    $this->table = 'orders';
    $this->entityClass = Order::class;
  }

  public function save(object $entity): object
  {
    return $this->doSave($entity);
  }

  public function findById($id): ?object
  {
    return $this->doFindById($id);
  }

  public function findAll(): array
  {
    throw new \RuntimeException('Operation not supported');
  }
}
