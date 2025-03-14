import { useState } from 'react';
import { useParams } from 'react-router-dom';
import parse from 'html-react-parser';
import styles from './ProductDetail.module.css';
import PropTypes from 'prop-types';

const ProductDetail = ({ products, onAddToCart }) => {
  const [selectedAttributes, setSelectedAttributes] = useState({});
  const [currentImageIndex, setCurrentImageIndex] = useState(0);
  const { id } = useParams();
  const product = products.find((product) => product.id === id);

  const areAllAttributesSelected = () => {
    if (product.attributes.length === 0) return true;
    return product.attributes.every(
      (attribute) => selectedAttributes[attribute.id]
    );
  };

  const handleAddToCart = () => {
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
    setSelectedAttributes({});
  };

  const handleThumbnailClick = (index) => {
    setCurrentImageIndex(index);
  };

  const handlePrevImage = () => {
    setCurrentImageIndex((prev) =>
      prev === 0 ? product.gallery.length - 1 : prev - 1
    );
  };

  const handleNextImage = () => {
    setCurrentImageIndex((prev) =>
      prev === product.gallery.length - 1 ? 0 : prev + 1
    );
  };

  return (
    <div className={styles['product-detail']}>
      <div className={styles['product-gallery']} data-testid='product-gallery'>
        <div className={styles['thumbnail-list']}>
          {product.gallery.map((image, index) => (
            <div
              key={index}
              className={`${styles.thumbnail} ${
                index === currentImageIndex ? styles.active : ''
              }`}
              onClick={() => handleThumbnailClick(index)}
            >
              <img src={image} alt={`${product.name} view ${index + 1}`} />
            </div>
          ))}
        </div>
        <div className={styles['main-image']}>
          <img src={product.gallery[currentImageIndex]} alt={product.name} />
          <button
            className={`${styles['nav-button']} ${styles.prev}`}
            onClick={handlePrevImage}
            aria-label='Previous image'
          >
            ‹
          </button>
          <button
            className={`${styles['nav-button']} ${styles.next}`}
            onClick={handleNextImage}
            aria-label='Next image'
          >
            ›
          </button>
        </div>
      </div>
      <div className={styles['product-info']}>
        <h1 className={styles['product-name']}>{product.name}</h1>

        <div className={styles['product-attributes']}>
          {product.attributes.length !== 0
            ? product.attributes.map((attribute) => (
                <div
                  key={attribute.id}
                  className={styles['attribute-selector']}
                  data-testid={`product-attribute-${attribute.name
                    .toLowerCase()
                    .replace(/\s+/g, '-')}`}
                >
                  <label>{attribute.id}:</label>
                  <div className={styles['attribute-options']}>
                    {attribute.items.map((item) => (
                      <button
                        key={item.id}
                        className={`${styles['attribute-option']} ${
                          selectedAttributes[attribute.id] === item.id
                            ? styles.selected
                            : ''
                        }`}
                        data-testid={`product-attribute-${attribute.name
                          .toLowerCase()
                          .replace(/\s+/g, '-')}-${item.id}${
                          selectedAttributes[attribute.id] === item.id
                            ? '-selected'
                            : ''
                        }`}
                        onClick={() =>
                          setSelectedAttributes({
                            ...selectedAttributes,
                            [attribute.id]: item.id,
                          })
                        }
                      >
                        {item.displayValue}
                      </button>
                    ))}
                  </div>
                </div>
              ))
            : null}
        </div>
        <p className={styles['product-price']}>
          Price: <br /> ${product.price.toFixed(2)}
        </p>

        {product.inStock ? (
          <button
            className={`${styles['add-to-cart-button']} ${
              !areAllAttributesSelected() ? styles.disabled : ''
            }`}
            data-testid='add-to-cart'
            onClick={handleAddToCart}
            disabled={!areAllAttributesSelected()}
          >
            {areAllAttributesSelected() ? 'ADD TO CART' : 'SELECT OPTIONS'}
          </button>
        ) : (
          <p className={styles['out-of-stock']}>Out of stock</p>
        )}

        <div className={styles['product-description']}>
          <p
            className={styles['product-description-text']}
            data-testid='product-description'
          >
            {parse(product.description)}
          </p>
        </div>
      </div>
    </div>
  );
};

ProductDetail.propTypes = {
  products: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
      prices: PropTypes.arrayOf(
        PropTypes.shape({
          amount: PropTypes.number.isRequired,
        })
      ).isRequired,
      gallery: PropTypes.arrayOf(PropTypes.string).isRequired,
      attributes: PropTypes.arrayOf(
        PropTypes.shape({
          id: PropTypes.string.isRequired,
          items: PropTypes.arrayOf(
            PropTypes.shape({
              id: PropTypes.string.isRequired,
              displayValue: PropTypes.string.isRequired,
            })
          ).isRequired,
        })
      ).isRequired,
      description: PropTypes.string.isRequired,
      inStock: PropTypes.bool.isRequired,
      category_id: PropTypes.number.isRequired,
    })
  ).isRequired,
  categories: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
    })
  ).isRequired,
  onAddToCart: PropTypes.func.isRequired,
};

export default ProductDetail;
