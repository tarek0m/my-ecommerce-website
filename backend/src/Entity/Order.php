<?php

declare(strict_types=1);

namespace MyStore\Entity;

/**
 * Order Entity
 * 
 * @property int $id Unique identifier for the order
 * @property string $order_date Date when the order was created
 * @property float $total_amount Total amount of the order
 * @property string|null $items JSON encoded array of order items
 * 
 * items JSON has product_id, quantity, unit_price, and selected_attributes
 */
class Order extends AbstractEntity
{
    public function getId(): int
    {
        return $this->data['id'];
    }

    public function getOrderDate(): string
    {
        return $this->data['order_date'];
    }

    public function getTotalAmount(): float
    {
        return (float)$this->data['total_amount'];
    }

    public function setId(int $id): self
    {
        $this->data['id'] = $id;
        return $this;
    }

    public function setOrderDate(string $orderDate): self
    {
        $this->data['order_date'] = $orderDate;
        return $this;
    }

    public function setTotalAmount(float $totalAmount): self
    {
        $this->data['total_amount'] = $totalAmount;
        return $this;
    }

    public function getItems(): ?array
    {
        return $this->data['items'] ? json_decode($this->data['items'], true) : null;
    }

    public function setItems(?array $items): self
    {
        $this->data['items'] = $items ? json_encode($items) : null;
        return $this;
    }
}
