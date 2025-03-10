<?php

declare(strict_types=1);

namespace MyStore\Database;

use PDO;

class ConnectionFactory
{
  private static ?PDO $connection = null;

  public static function getConnection(): PDO
  {
    if (self::$connection === null) {
      $host = $_ENV['DB_HOST'];
      $port = $_ENV['DB_PORT'];
      $dbname = $_ENV['DB_NAME'];
      $username = $_ENV['DB_USER'];
      $password = $_ENV['DB_PASS'];

      $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=utf8mb4";

      self::$connection = new PDO(
        $dsn,
        $username,
        $password,
        [
          PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
          PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]
      );
    }

    return self::$connection;
  }
}
