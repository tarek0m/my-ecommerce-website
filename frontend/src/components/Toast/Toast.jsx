import { useEffect } from 'react';
import PropTypes from 'prop-types';
import styles from './Toast.module.css';

const Toast = ({ message, type, onClose, duration = 5000 }) => {
  useEffect(() => {
    const timer = setTimeout(() => {
      onClose();
    }, duration);

    return () => clearTimeout(timer);
  }, [duration, onClose]);

  return (
    <div
      className={`${styles.toast} ${styles[type]}`}
      role='alert'
      data-testid='toast-message'
    >
      <div className={styles.content}>{message}</div>
      <button
        className={styles.closeButton}
        onClick={onClose}
        aria-label='Close notification'
      >
        ×
      </button>
    </div>
  );
};

Toast.propTypes = {
  message: PropTypes.string.isRequired,
  type: PropTypes.oneOf(['success', 'error']).isRequired,
  onClose: PropTypes.func.isRequired,
  duration: PropTypes.number,
};

export default Toast;
