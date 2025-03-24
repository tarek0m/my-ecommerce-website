<?php

declare(strict_types=1);

namespace MyStore\Repository;

use MyStore\Entity\AttributeSet;
use PDO;

class AttributeSetRepository extends AbstractRepository implements ReadOnlyRepositoryInterface
{
  public function __construct(PDO $connection)
  {
    parent::__construct($connection);
    $this->table = 'attribute_sets';
    $this->entityClass = AttributeSet::class;
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
