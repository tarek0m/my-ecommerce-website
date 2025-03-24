<?php

declare(strict_types=1);

namespace MyStore\Repository;

use MyStore\Entity\ProductAttribute;
use PDO;

class ProductAttributeRepository extends AbstractRepository implements RepositoryInterface
{
  public function __construct(PDO $connection)
  {
    parent::__construct($connection);
    $this->table = 'product_attributes';
    $this->entityClass = ProductAttribute::class;
  }

  public function findById($id): ?object
  {
    throw new \RuntimeException('Operation not supported');
  }

  public function findAll(): array
  {
    throw new \RuntimeException('Operation not supported');
  }

  public function save(object $entity): object
  {
    return $this->doSave($entity);
  }

  /**
   * Save multiple product attributes in a transaction
   * 
   * @param array $entities Array of ProductAttribute entities
   * @return array
   */
  public function saveMany(array $entities): array
  {
    $this->connection->beginTransaction();

    try {
      $saved = [];
      foreach ($entities as $entity) {
        $saved[] = $this->save($entity);
      }
      $this->connection->commit();
      return $saved;
    } catch (\Exception $e) {
      $this->connection->rollBack();
      throw $e;
    }
  }

  /**
   * Delete product attributes by product ID
   * 
   * @param string $productId
   * @return void
   */
  public function deleteByProductId(string $productId): void
  {
    $stmt = $this->connection->prepare("DELETE FROM {$this->table} WHERE product_id = :product_id");
    $stmt->execute(['product_id' => $productId]);
  }
}
