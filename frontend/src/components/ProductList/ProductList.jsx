import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import styles from './ProductList.module.css';

const ProductList = ({
  categoryName,
  products,
  categories,
  onAddToCart,
  onCategorySelect,
}) => {
  return (
    <div className={styles['product-list']}>
      <h1 className={styles['page-title']}>
        {categoryName.charAt(0).toUpperCase() +
          categoryName.slice(1).toLowerCase()}
      </h1>
      <div className={styles['products-grid']}>
        {products.map((product) => (
          <div
            key={product.id}
            className={`${styles['product-card']} ${
              !product.inStock ? styles['out-of-stock'] : ''
            }`}
            data-testid={`product-${product.name
              .toLowerCase()
              .replace(/\s+/g, '-')}`}
          >
            <Link
              to={`/${
                categories.find((cat) => cat.id === product.category_id)?.name
              }/${product.id}`}
              className={styles['product-link']}
              onClick={() =>
                onCategorySelect(
                  categories.find((cat) => cat.id === product.category_id)
                )
              }
            >
              <div className={styles['product-image']}>
                <img src={product.gallery[0]} alt={product.name} />
                {!product.inStock && (
                  <div className={styles['out-of-stock-overlay']}>
                    OUT OF STOCK
                  </div>
                )}
              </div>
              <div className={styles['product-info']}>
                <h3 className={styles['product-name']}>{product.name}</h3>
                <p className={styles['product-price']}>
                  {product.currency.symbol}
                  {product.price.toFixed(2)}
                </p>
              </div>
            </Link>
            {product.inStock && (
              <button
                className={styles['quick-shop-btn']}
                onClick={(e) => {
                  e.preventDefault();
                  const selectedAttributes = {};
                  product.attributes.forEach((attribute) => {
                    selectedAttributes[attribute.id] = attribute.items[0].id;
                  });
                  const cartItem = {
                    id: product.id,
                    name: product.name,
                    price: product.price,
                    quantity: 1,
                    image: product.gallery[0],
                    attributes: product.attributes,
                    selectedAttributes,
                  };
                  onAddToCart(cartItem);
                }}
              >
                <img
                  src='/EmptyCart.svg'
                  alt='Empty Cart'
                  style={{ filter: 'brightness(0) invert(1)' }}
                />
              </button>
            )}
          </div>
        ))}
      </div>
    </div>
  );
};

ProductList.propTypes = {
  products: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
      prices: PropTypes.arrayOf(
        PropTypes.shape({
          amount: PropTypes.number.isRequired,
        })
      ),
      gallery: PropTypes.arrayOf(PropTypes.string).isRequired,
      inStock: PropTypes.bool.isRequired,
    })
  ).isRequired,
  categories: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
    })
  ).isRequired,
  categoryName: PropTypes.string.isRequired,
  onAddToCart: PropTypes.func.isRequired,
  onCategorySelect: PropTypes.func.isRequired,
};

export default ProductList;
