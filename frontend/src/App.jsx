import { useState, useEffect, useMemo } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import ProductList from './components/ProductList/ProductList';
import ProductDetail from './components/ProductDetail/ProductDetail';
import Navbar from './components/Navbar/Navbar';
import Cart from './components/Cart/Cart';
import Toast from './components/Toast/Toast';
import './App.css';
import { GET_PRODUCTS, GET_CATEGORIES } from './utils/graphql';
import graphqlRequest from './utils/graphql';
import { CREATE_ORDER } from './utils/mutations';

function App() {
  const [selectedCategory, setSelectedCategory] = useState({
    id: 1,
    name: 'all',
  });
  const [cartItems, setCartItems] = useState([]);
  const [isCartOpen, setIsCartOpen] = useState(false);
  const [categories, setCategories] = useState([]);
  const [products, setProducts] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [toast, setToast] = useState({
    show: false,
    message: '',
    type: 'success',
  });

  // Load cart from localStorage
  useEffect(() => {
    const savedCart = localStorage.getItem('cart');
    if (savedCart) {
      setCartItems(JSON.parse(savedCart));
    }
  }, []);

  // Save cart to localStorage when it changes
  useEffect(() => {
    localStorage.setItem('cart', JSON.stringify(cartItems));
  }, [cartItems]);

  // Fetch products and categories
  useEffect(() => {
    const fetchData = async () => {
      try {
        const [productsData, categoriesData] = await Promise.all([
          graphqlRequest(GET_PRODUCTS),
          graphqlRequest(GET_CATEGORIES),
        ]);

        // Parse string fields before setting state
        const parsedProducts = productsData.data.products.map((product) => ({
          ...product,
          currency: product.currency ? JSON.parse(product.currency) : null,
          gallery: product.gallery ? JSON.parse(product.gallery) : [],
          attributes: product.attributes ? JSON.parse(product.attributes) : [],
        }));

        setProducts(parsedProducts);
        setCategories(categoriesData.data.categories);
        setIsLoading(false);
      } catch (error) {
        console.error('Error fetching data:', error);
        setIsLoading(false);
        setToast({
          show: true,
          message: 'Failed to load data: ' + error.message,
          type: 'error',
        });
      }
    };
    fetchData();
  }, []);

  // Calculate derived values only when not loading
  const totalQuantity = useMemo(() => {
    return cartItems.reduce((sum, item) => sum + item.quantity, 0);
  }, [cartItems]);

  const total = useMemo(() => {
    return cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }, [cartItems]);

  // Filter products based on selected category
  const filteredProducts = useMemo(() => {
    if (products.length === 0) return [];
    return selectedCategory.name === 'all'
      ? products
      : products.filter(
          (product) => product.category_id === selectedCategory.id
        );
  }, [products, selectedCategory]);

  const addToCart = (item) => {
    setCartItems((prevItems) => {
      const existingItem = prevItems.find((i) => {
        if (i.id !== item.id) return false;

        // Check if all selected attributes match
        for (const attribute of item.attributes) {
          if (i[attribute.id] !== item[attribute.id]) {
            return false;
          }
        }
        return true;
      });

      if (existingItem) {
        return prevItems.map((i) =>
          i === existingItem ? { ...i, quantity: i.quantity + 1 } : i
        );
      }

      return [...prevItems, item];
    });
  };

  const updateCartItemQuantity = (itemId, change) => {
    setCartItems((prevItems) => {
      const updatedItems = prevItems.map((item) => {
        if (item.id === itemId) {
          const newQuantity = item.quantity + change;
          return newQuantity > 0 ? { ...item, quantity: newQuantity } : null;
        }
        return item;
      });
      return updatedItems.filter(Boolean);
    });
  };

  const handlePlaceOrder = async () => {
    try {
      const orderItems = cartItems.map((item) => ({
        product_id: item.id,
        quantity: item.quantity,
        unit_price: item.price,
        selected_attributes: item.selectedAttributes || 5,
      }));

      const response = await graphqlRequest(CREATE_ORDER, {
        items: JSON.stringify(orderItems),
      });

      const createdOrder = response.data.createOrder;
      setCartItems([]);
      setIsCartOpen(false);
      setToast({
        show: true,
        message: `Order ${createdOrder.id} placed successfully!`,
        type: 'success',
      });
    } catch (error) {
      setToast({
        show: true,
        message: 'Failed to place order: ' + error.message,
        type: 'error',
      });
    }
  };

  // Show loading screen until data is fetched
  if (isLoading) {
    return (
      <div className='loading-container'>
        <div className='loading-spinner'></div>
        <p>Loading...</p>
      </div>
    );
  }

  return (
    <BrowserRouter>
      <div className='app'>
        {toast.show && (
          <Toast
            message={toast.message}
            type={toast.type}
            onClose={() => setToast({ ...toast, show: false })}
          />
        )}
        <Navbar
          categories={categories}
          selectedCategory={selectedCategory.name}
          onCategorySelect={setSelectedCategory}
          cartItemCount={totalQuantity}
          onCartClick={() => setIsCartOpen(!isCartOpen)}
        />
        {isCartOpen
          ? document
              .querySelector(':root')
              .style.setProperty('overflow', 'hidden')
          : document
              .querySelector(':root')
              .style.setProperty('overflow', 'auto')}
        {isCartOpen && (
          <>
            <div
              className='cart-overlay-backdrop'
              onClick={() => {
                setIsCartOpen(false);
              }}
            />
            <Cart
              items={cartItems}
              totalQuantity={totalQuantity}
              total={total}
              onUpdateQuantity={updateCartItemQuantity}
              onPlaceOrder={handlePlaceOrder}
            />
          </>
        )}
        <main>
          <Routes>
            <Route
              path='/'
              element={
                <ProductList
                  categoryName={selectedCategory.name}
                  products={filteredProducts}
                  onAddToCart={addToCart}
                />
              }
            />
            <Route
              path='/product/:id'
              element={
                <ProductDetail products={products} onAddToCart={addToCart} />
              }
            />
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}

export default App;
