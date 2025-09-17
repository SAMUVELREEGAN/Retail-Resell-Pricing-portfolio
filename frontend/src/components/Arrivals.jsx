import { useState, useEffect } from 'react';
import './Arrivals.css';
import { FaIndianRupeeSign } from "react-icons/fa6";
import { Link } from 'react-router-dom';
import { MdFavorite } from "react-icons/md";
import { useMyContext } from '../context/MyContext';

const Arrivals = () => {
  const { products, BASE_URL, pic1 } = useMyContext();
  const [wishlist, setWishlist] = useState([]);

  useEffect(() => {
    const savedWishlist = JSON.parse(localStorage.getItem('wishlist')) || [];
    setWishlist(savedWishlist);
  }, []);

  const toggleWishlist = (product) => {
    let updatedWishlist = [...wishlist];
    const isProductInWishlist = updatedWishlist.some(item => item.id === product.id);

    if (isProductInWishlist) {
      updatedWishlist = updatedWishlist.filter(item => item.id !== product.id);
    } else {
      updatedWishlist.push(product);
    }

    localStorage.setItem('wishlist', JSON.stringify(updatedWishlist));
    setWishlist(updatedWishlist);
  };

  const newArrivalProducts = Array.isArray(products)
    ? products.filter(product => product.link_name === 'all').slice(-4)
    : [];

  const getProductImage = (product) => {
    if (product.images && product.images.length > 0) {
      const imgPath = product.images[0].image;
      return `${BASE_URL}${imgPath.startsWith('/') ? '' : '/'}${imgPath}`;
    }
    return pic1;
  };

  return (
    <div className="arrivals-wrapper">
      <h3 className="title">New Arrivals</h3>
      <div className="arrivals">
        {newArrivalProducts.map(product => (
          <div key={product.id} className="arrival_card">
            <Link to={`/product/${product.id}`} style={{ textDecoration: 'none', color: 'inherit' }}>
              <div className="arrival-image-container">
                <img
                  src={getProductImage(product)}
                  alt={product.pro_name}
                  className="card-img-top"
                />
              </div>
              <div className="card-body">
                <div className="title-price">
                  <h5 className="card-title">{product.pro_name}</h5>
                  <h5><FaIndianRupeeSign /> {product.price}</h5>
                </div>
                <p className="item-descriptionx">{product.description}</p>
              </div>
            </Link>

            <MdFavorite
              className="wishlist-heart"
              onClick={() => toggleWishlist(product)}
              style={{
                color: wishlist.some(item => item.id === product.id) ? 'red' : 'gray'
              }}
            />
          </div>
        ))}
      </div>
    </div>
  );
};

export default Arrivals;
