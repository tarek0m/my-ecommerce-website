<?php

declare(strict_types=1);

namespace MyStore\Router;

use MyStore\Controller\GraphQL;

class Router
{
    private array $routes = [];
    private GraphQL $controller;

    public function __construct()
    {
        $this->controller = new GraphQL();
        $this->initializeRoutes();
    }

    private function initializeRoutes(): void
    {
        $this->routes['graphql'] = [
            'POST' => [$this->controller, 'handle'],
            'OPTIONS' => [$this, 'handleOptions']
        ];
    }

    public function handleOptions(): string
    {
        // Just return empty response for OPTIONS requests
        // Headers are already set in index.php
        return json_encode([]);
    }

    public function dispatch(string $path, string $method): array
    {
        $pathParts = explode('/', trim($path, '/'));
        $base = $pathParts[0] ?? '';

        $route = $base;

        if (!isset($this->routes[$route][$method])) {
            return [
                'status' => 'error',
                'message' => 'Route not found',
                'code' => 404
            ];
        }

        [$controller, $action] = $this->routes[$route][$method];
        try {
            $result = $controller->$action();

            if ($result === null) {
                return [
                    'status' => 'error',
                    'message' => 'Resource not found',
                    'code' => 404
                ];
            }

            return [
                'status' => 'successful dispatching',
                'data' => json_decode($result, true),
                'code' => 200
            ];
        } catch (\Exception $e) {
            return [
                'status' => 'error',
                'message' => 'Internal Server Error',
                'code' => 500
            ];
        }
    }
}
