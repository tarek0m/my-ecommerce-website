<?php

declare(strict_types=1);

use Dotenv\Dotenv;

require_once __DIR__ . '/../vendor/autoload.php';

$dotenv = Dotenv::createImmutable(__DIR__ . '/..');
$dotenv->load();

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Max-Age: 86400');


$requestUri = $_SERVER['REQUEST_URI'];
$requestMethod = $_SERVER['REQUEST_METHOD'];

// Handle preflight OPTIONS requests for CORS
if ($requestMethod === 'OPTIONS') {
    http_response_code(200);
    exit();
}

use MyStore\Router\Router;

$router = new Router();

try {
    $path = parse_url($requestUri, PHP_URL_PATH);
    $result = $router->dispatch($path, $requestMethod);

    http_response_code($result['code']);
    unset($result['code']);
    echo json_encode($result);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Internal Server Error'
    ]);
}
