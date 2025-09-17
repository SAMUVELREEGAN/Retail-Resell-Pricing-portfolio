import { useMyContext } from '../context/MyContext';
import './CategoryItem.css';
import { Link } from 'react-router-dom';

const CategoryItem = ({ product, onCompare, isCompared, isDealerPage, onAddToCart, inCart }) => {
  const { BASE_URL, pic1 } = useMyContext();
  // const location = useLocation();

  const handleCompare = (e) => {
    e.stopPropagation();
    onCompare(product);
  };

  const handleAddToCartClick = (e) => {
    e.stopPropagation();
    onAddToCart(product);
  };

  const getProductImage = (product) => {
    if (product.images && product.images.length > 0) {
      const imgPath = product.images[0].image;
      return `${BASE_URL}${imgPath.startsWith('/') ? '' : '/'}${imgPath}`;
    }
    return pic1;  
  };

  return (
    <div className={`${isCompared ? 'card_remove' : ''} category-card`}>
      <div className="category-image-wrapper">
        <span className="type-badge">{product.type}</span>
        <img
          src={getProductImage(product)}
          alt={product.pro_name}
          className="category-image"
        />
      </div>
      <div className="category-info">
        {isDealerPage ? (
          <>
            <Link to={`/dealer/${product.link_name}/${product.id}`} style={{ textDecoration: 'none', color: 'black' }}>
              <p className="product-name mb-1">{product.pro_name}</p>
              <p className="product-price">
                <span className="price">₹{product.price}</span>
              </p>
              <p className="item-descriptionaa">{product.description}</p>
            </Link>
          </>
        ) : (
          <Link to={`/product/${product.id}`} style={{ textDecoration: 'none', color: 'black' }}>
            <p className="product-name mb-1">{product.pro_name}</p>
            <p className="product-price">
              <span className="price">₹{product.price}</span>
            </p>
            <p className="item-descriptionaa">{product.description}</p>
          </Link>
        )}

        <div className="button-container">
          {!isDealerPage && (
            <button
              onClick={handleCompare}
              className={`compare-btn ${isCompared ? 'remove' : ''}`}
            >
              {isCompared ? 'Remove Compare' : 'Compare'}
            </button>
          )}
          {isDealerPage && (
            <button
              className={`cart-btn ${inCart ? 'remove-from-cart' : 'add-to-cart'}`}
              onClick={handleAddToCartClick}
            >
              {inCart ? 'Remove' : 'Add to Order'}
            </button>
          )}
        </div>
      </div>
    </div>
  );
};

export default CategoryItem;