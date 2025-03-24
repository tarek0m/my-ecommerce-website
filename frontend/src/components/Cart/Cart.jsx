import styles from './Cart.module.css';
import PropTypes from 'prop-types';

const Cart = ({
  items,
  total,
  totalQuantity,
  onUpdateQuantity,
  onPlaceOrder,
}) => {
  return (
    <div className={styles.cart} data-testid='cart-overlay'>
      <h1 className={styles['cart-title']}>
        My Bag,{' '}
        <span className={styles['total-quantity']}>
          {totalQuantity} {totalQuantity === 1 ? 'item' : 'items'}
        </span>
      </h1>
      <div className={styles['cart-content']}>
        <div className={styles['cart-items']}>
          {items.map((item) => (
            <div
              key={`${item.id}-${Object.values(item)
                .filter((val) => typeof val === 'string')
                .join('-')}`}
              className={styles['cart-item']}
              data-testid='cart-item'
            >
              <div className={styles['item-details']}>
                <div className={styles['item-info']}>
                  <h3 className={styles['item-name']}>{item.name}</h3>
                  <p className={styles['item-price']}>
                    ${item.price.toFixed(2)}
                  </p>
                  <div className={styles['product-attributes']}>
                    {item.attributes.length !== 0
                      ? item.attributes.map((attribute) => (
                          <div
                            key={attribute.id}
                            className={styles['attribute-selector']}
                            data-testid={`product-attribute-${attribute.name
                              .toLowerCase()
                              .replace(/\s+/g, '-')}`}
                          >
                            <label>{attribute.id}:</label>
                            <div className={styles['attribute-options']}>
                              {attribute.items.map((attrItem) => (
                                <button
                                  key={attrItem.id}
                                  className={`${styles['attribute-option']} ${
                                    item.selectedAttributes[attribute.id] ===
                                    attrItem.id
                                      ? styles.selected
                                      : ''
                                  }`}
                                  disabled
                                  data-testid={`product-attribute-${attribute.name
                                    .toLowerCase()
                                    .replace(/\s+/g, '-')}-${attrItem.id}${
                                    item.selectedAttributes[attribute.id] ===
                                    attrItem.id
                                      ? '-selected'
                                      : ''
                                  }`}
                                >
                                  {attrItem.displayValue}
                                </button>
                              ))}
                            </div>
                          </div>
                        ))
                      : null}
                  </div>
                </div>
                <div className={styles['item-quantity']}>
                  <button
                    className={styles['quantity-btn']}
                    data-testid='cart-item-amount-increase'
                    onClick={() => onUpdateQuantity(item.id, 1)}
                  >
                    +
                  </button>
                  <span
                    className={styles.quantity}
                    data-testid='cart-item-amount'
                  >
                    {item.quantity}
                  </span>
                  <button
                    className={styles['quantity-btn']}
                    data-testid='cart-item-amount-decrease'
                    onClick={() => onUpdateQuantity(item.id, -1)}
                  >
                    -
                  </button>
                </div>
                <div className={styles['item-image']}>
                  <img src={item.image} alt={item.name} />
                </div>
              </div>
            </div>
          ))}
        </div>
        <div className={styles['cart-summary']}>
          <div className={styles['summary-row']} data-testid='cart-total'>
            <span>Total</span>
            <span>${total.toFixed(2)}</span>
          </div>
          <button
            className={`${styles['place-order-button']} ${
              items.length === 0 ? styles.disabled : ''
            }`}
            onClick={onPlaceOrder}
            disabled={items.length === 0}
          >
            PLACE ORDER
          </button>
        </div>
      </div>
    </div>
  );
};

Cart.propTypes = {
  onUpdateQuantity: PropTypes.func.isRequired,
  onPlaceOrder: PropTypes.func.isRequired,
  items: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
      price: PropTypes.number.isRequired,
      quantity: PropTypes.number.isRequired,
      attributes: PropTypes.array.isRequired,
      image: PropTypes.string.isRequired,
    })
  ).isRequired,
  total: PropTypes.number.isRequired,
  totalQuantity: PropTypes.number.isRequired,
};

export default Cart;
