import PropTypes from 'prop-types';
import styles from './Navbar.module.css';
import { Link } from 'react-router-dom';

function Navbar({
  categories,
  selectedCategory,
  onCategorySelect,
  cartItemCount,
  onCartClick,
}) {
  return (
    <nav className={styles.navbar}>
      <div className={styles['nav-categories']}>
        {categories.map((category) => (
          <Link to='/' key={category.name}>
            <button
              className={`${styles['nav-link']} ${
                selectedCategory === category.name ? styles.active : ''
              }`}
              onClick={() => onCategorySelect(category)}
              data-testid={`${
                selectedCategory === category.name
                  ? 'active-category-link'
                  : 'category-link'
              }`}
            >
              {category.name.toUpperCase()}
            </button>
          </Link>
        ))}
      </div>
      <Link to='/'>
        <div className={styles['nav-brand']}>
          <img
            src='src/assets/Icon/a-logo.svg'
            alt='Logo'
            className={styles['brand-logo']}
          />
        </div>
      </Link>
      <div
        className={styles['cart-icon']}
        data-testid='cart-btn'
        onClick={onCartClick}
      >
        <img src='src/assets/Icon/EmptyCart.svg' alt='Empty Cart' />
        {cartItemCount > 0 && (
          <span className={styles['cart-count']}>{cartItemCount}</span>
        )}
      </div>
    </nav>
  );
}

Navbar.propTypes = {
  categories: PropTypes.arrayOf(PropTypes.object).isRequired,
  selectedCategory: PropTypes.string.isRequired,
  onCategorySelect: PropTypes.func.isRequired,
  cartItemCount: PropTypes.number.isRequired,
  onCartClick: PropTypes.func.isRequired,
};

export default Navbar;
