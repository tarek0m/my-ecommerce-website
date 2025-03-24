<?php

declare(strict_types=1);

namespace MyStore\Repository;

use MyStore\Entity\AttributeItem;
use PDO;

class AttributeItemRepository extends AbstractRepository implements ReadOnlyRepositoryInterface
{
  public function __construct(PDO $connection)
  {
    parent::__construct($connection);
    $this->table = 'attribute_items';
    $this->entityClass = AttributeItem::class;
  }

  public function findById($id): ?object
  {
    return $this->doFindById($id);
  }

  public function findAll(): array
  {
    return $this->doFindAll();
  }

  /**
   * Find attribute items by product ID through the junction table
   * 
   * @param string $productId
   * @return array
   */
  public function findByProductId(string $productId): array
  {
    $sql = "SELECT ai.* FROM {$this->table} ai "
      . "INNER JOIN product_attributes pa ON pa.attribute_item_id = ai.id "
      . "WHERE pa.product_id = :product_id";

    $stmt = $this->connection->prepare($sql);
    $stmt->execute(['product_id' => $productId]);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $entities = [];
    foreach ($data as $row) {
      $entity = new $this->entityClass();
      $entities[] = $entity->fromArray($row);
    }

    return $entities;
  }
}
