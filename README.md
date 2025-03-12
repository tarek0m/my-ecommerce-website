# My E-Commerce Website

A modern, full-stack e-commerce application with a React frontend and PHP GraphQL backend.

## Project Overview

This project is a complete e-commerce solution featuring:

- Modern React frontend with Vite
- PHP 8.1 backend with GraphQL API
- MySQL database for data storage
- Shopping cart functionality with local storage persistence
- Product categorization and filtering
- Order processing system

## Tech Stack

### Frontend

- React 19
- React Router 7
- Vite 6
- CSS Modules for styling
- GraphQL for data fetching

### Backend

- PHP 8.1
- GraphQL PHP
- PDO for database access
- Fast Route for routing
- PHPDotEnv for environment configuration

## Project Structure

```
/
├── frontend/               # React frontend application
│   ├── public/             # Static assets
│   ├── src/                # Source code
│   │   ├── assets/         # Images and other assets
│   │   ├── components/     # React components
│   │   ├── styles/         # Global styles
│   │   ├── utils/          # Utility functions and GraphQL queries
│   │   ├── App.jsx         # Main application component
│   │   └── main.jsx        # Application entry point
│   ├── index.html          # HTML template
│   ├── package.json        # Frontend dependencies
│   └── vite.config.js      # Vite configuration
│
└── backend/                # PHP backend application
    ├── database/           # Database schema and sample data
    ├── public/             # Public entry point
    ├── src/                # Source code
    │   ├── Controller/     # Request controllers
    │   ├── Database/       # Database connection handling
    │   ├── Entity/         # Data entities
    │   ├── GraphQL/        # GraphQL type definitions
    │   ├── Repository/     # Data access layer
    │   └── Router/         # Request routing
    ├── composer.json       # Backend dependencies
    └── .env                # Environment configuration (not tracked in git)
```

## Features

- **Product Browsing**: View products by category with filtering options
- **Product Details**: Detailed product pages with images and attributes
- **Shopping Cart**: Add products to cart with quantity management
- **Local Storage**: Cart persists between sessions using browser storage
- **Order Processing**: Submit orders through GraphQL mutations

## Installation

### Prerequisites

- PHP 8.1 or higher
- Composer
- Node.js 16 or higher
- MySQL 5.7 or higher

### Backend Setup

1. Navigate to the backend directory:

   ```
   cd backend
   ```

2. Install dependencies:

   ```
   composer install
   ```

3. Create a `.env` file based on `.env.example` (if available) with your database credentials:

   ```
   DB_HOST=localhost
   DB_PORT=3306
   DB_NAME=ecommerce
   DB_USER=your_username
   DB_PASS=your_password
   ```

4. Set up the database:

   ```
   mysql -u your_username -p < database/schema.sql
   mysql -u your_username -p < database/data.sql
   ```

5. Start the PHP server:
   ```
   php -S localhost:8000 -t public
   ```

### Frontend Setup

1. Navigate to the frontend directory:

   ```
   cd frontend
   ```

2. Install dependencies:

   ```
   npm install
   ```

3. Start the development server:

   ```
   npm run dev
   ```

4. The application will be available at `http://localhost:3000`

## API Documentation

The backend exposes a GraphQL API at `/graphql` with the following operations:

### Queries

- `categories`: Fetch all product categories
- `products`: Fetch all products with details

### Mutations

- `createOrder`: Create a new order with items

## Development

### Frontend

- `npm run dev`: Start development server
- `npm run build`: Build for production
- `npm run preview`: Preview production build

### Backend

- `composer cs-check`: Check code style
- `composer cs-fix`: Fix code style issues
