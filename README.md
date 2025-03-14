# My E-Commerce Website

A modern, full-stack e-commerce application with a React frontend and PHP GraphQL backend.

## Live Demo

Explore the live application: [Modern Store](https://modern-store-tarek0m.infy.uk/)

![](/frontend/public/Gallery/1.png)

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

## Gallery

![](/frontend/public/Gallery/2.png)
![](/frontend/public/Gallery/3.png)
![](/frontend/public/Gallery/4.png)

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

## Deployment Guide

This application is configured for deployment on InfinityFree hosting. Follow these steps for a successful deployment:

### 1. Prepare for Deployment

1. Build the frontend application:

   ```bash
   cd frontend
   npm run build
   ```

2. Prepare your backend configuration:
   - Create a `constants.php` file in the backend/src/Database directory with your database credentials:
     ```php
     <?php
     define('DB_HOST', 'your_infinityfree_host');
     define('DB_PORT', '3306');
     define('DB_NAME', 'your_database_name');
     define('DB_USER', 'your_username');
     define('DB_PASS', 'your_password');
     ```
   - Download all dependencies locally using `composer install`
   - Keep the generated `vendor` folder as it needs to be uploaded

### 2. Upload to InfinityFree

1. Upload the backend files including the `vendor` folder to the `htdocs` folder
2. Upload the frontend build (from `frontend/dist`) to the same `htdocs` folder
3. Configure the database using phpMyAdmin:
   - Import `database/schema.sql`
   - Import `database/data.sql`
   - Update `constants.php` with your InfinityFree database credentials

### 3. Configure Server Settings

To ensure proper functionality, you'll need to address two common deployment challenges:

#### MIME Type Configuration

Change `.js` to `.mjs`

Create `fix-mime.php` in your root directory to handle JavaScript and CSS files correctly:

```php
<?php
$path = $_GET['file'];
$extension = pathinfo($path, PATHINFO_EXTENSION);

if ($extension === 'mjs') {
    header("Content-Type: application/javascript");
} elseif ($extension === 'css') {
    header("Content-Type: text/css");
}
readfile($path);
?>
```

Update your `index.html` to use this handler:

```html
<script type="module" src="fix-mime.php?file=index-[hash].mjs"></script>
<link rel="stylesheet" href="fix-mime.php?file=index-[hash].css" />
```

This bypasses InfinityFree’s MIME restrictions by forcing the correct Content-Type via PHP.

#### URL Rewriting

Create `.htaccess` in your root directory:

```apache
RewriteEngine On

# Set default document
DirectoryIndex index.html

# Configure MIME types
AddType application/javascript .mjs
AddType text/css .css

# Handle MIME type fix requests
RewriteCond %{REQUEST_URI} ^/fix-mime\.php$ [NC]
RewriteRule ^ - [L]

# Route GraphQL requests
RewriteCond %{REQUEST_URI} ^/graphql$ [NC]
RewriteRule ^ index.php [L]

# Handle frontend routes
RewriteCond %{REQUEST_URI} !\.(js|mjs|css|json|png|jpg|jpeg|gif|svg|ico|woff|woff2|ttf|otf|eot|mp4|webm|ogg|mp3|wav|txt|xml)$ [NC]
RewriteCond %{REQUEST_URI} !^/fix-mime\.php$ [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.html [L]
```

### 4. Verify Deployment

1. Test the frontend routes
2. Verify API connectivity
3. Check database connections
4. Ensure static assets load correctly
