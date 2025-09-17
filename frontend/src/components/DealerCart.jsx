import { useEffect, useState } from 'react';
import { useMyContext } from '../context/MyContext';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import './DealerCart.css';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import {
  FaMinus,
  FaPlus,
  FaCheckCircle,
  FaTimesCircle,
  FaShoppingCart,
  FaEnvelopeOpenText,
  FaTrashAlt
} from 'react-icons/fa';
import { IoPricetagsSharp } from 'react-icons/io5';
import { SiVirustotal } from 'react-icons/si';

const DealerCart = () => {
  const { BASE_URL } = useMyContext();
  const { link_name } = useParams();

  const [cartItems, setCartItems] = useState([]);
  const [quantities, setQuantities] = useState({});
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone_number: '',
  });
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    const saved = JSON.parse(localStorage.getItem('dealer_cart')) || [];
    setCartItems(saved);
    const initialQuantities = {};
    saved.forEach(item => {
      initialQuantities[item.id] = 1;
    });
    setQuantities(initialQuantities);
  }, []);

  const getProductImage = (product) => {
    if (product.images?.length > 0) {
      const img = product.images[0].image;
      return `${BASE_URL}${img.startsWith('/') ? '' : '/'}${img}`;
    }
    return '';
  };

  const handleQuantityChange = (id, delta) => {
    setQuantities(prev => {
      const updated = { ...prev, [id]: Math.max(1, (prev[id] || 1) + delta) };
      return updated;
    });
  };

  const getTotalPrice = () => {
    return cartItems.reduce((sum, item) => {
      const qty = quantities[item.id] || 1;
      return sum + parseFloat(item.price) * qty;
    }, 0);
  };

  const handleInputChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleRemoveItem = (id) => {
    const updatedItems = cartItems.filter(item => item.id !== id);
    setCartItems(updatedItems);
    localStorage.setItem('dealer_cart', JSON.stringify(updatedItems));
    toast.info('Product removed from cart', { position: 'top-right' });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitting(true);
    try {
      const payload = {
        name: formData.name,
        email: formData.email,
        phone_number: formData.phone_number,
        items: cartItems.map(item => ({
          Product_id: item.id,
          pro_name: item.pro_name,
          price: item.price,
          quantity: quantities[item.id] || 1,
        })),
        total: getTotalPrice(),
        link_name: link_name,
      };

      await axios.post(`${BASE_URL}/api/enquiries/enquieryadd/`, payload);

      toast.success('Enquiry sent successfully!', {
        position: 'top-right',
        icon: <FaCheckCircle />,
      });

      localStorage.removeItem('dealer_cart');
      setCartItems([]);
      setFormData({ name: '', email: '', phone_number: '' });
    } catch (err) {
      console.error(err);
      toast.error('Enquiry failed. Try again.', {
        position: 'top-right',
        icon: <FaTimesCircle />,
      });
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="container my-4">
      <ToastContainer position="top-right" autoClose={3000} />
      <div className="row">
        <div className="col-md-7 mb-4">
          <h4 className="mb-3">
            <FaShoppingCart className="me-2" /> Your Dealer Cart
          </h4>
          {cartItems.length === 0 ? (
            <div className="text-center text-muted fs-5">🛒 No items in cart</div>
          ) : (
            cartItems.map((item) => (
              <div
                key={item.id}
                className="cart-item-modern d-flex gap-3 mb-4 p-3 rounded-4 bg-white shadow-sm position-relative align-items-center"
              >
                <img
                  src={getProductImage(item)}
                  alt={item.pro_name}
                  className="cart-img-modern"
                />
                <div className="flex-grow-1">
                  <button
                    className="btn btn-sm btn-danger position-absolute top-0 end-0 m-2"
                    onClick={() => handleRemoveItem(item.id)}
                    title="Remove"
                  >
                    <FaTrashAlt />
                  </button>
                  <h6 className="fw-semibold mb-1 text-dark">{item.pro_name}</h6>
                  <div className="text-secondary small mb-2">Unit Price: ₹{item.price}</div>
                  <div className="d-flex align-items-center gap-2 mb-2">
                    <button className="btn btn-outline-dark quantity-btn" onClick={() => handleQuantityChange(item.id, -1)}>
                      <FaMinus style={{marginTop:"-5px"}}/>
                    </button>
                    <span className="fw-bold fs-6 px-2">{quantities[item.id] || 1}</span>
                    <button className="btn btn-outline-dark quantity-btn" onClick={() => handleQuantityChange(item.id, 1)}>
                      <FaPlus style={{marginTop:"-5px"}}/>
                    </button>
                  </div>
                  <div className="fw-bold text-success">
                    <IoPricetagsSharp className="me-1" />
                    ₹{(parseFloat(item.price) * (quantities[item.id] || 1)).toFixed(2)}
                  </div>
                </div>
              </div>
            ))
          )}
          {cartItems.length > 0 && (
            <h5 className="mt-4 text-end total-price">
              <SiVirustotal className="me-2 text-dark" />
              Total: ₹{getTotalPrice().toFixed(2)}
            </h5>
          )}
        </div>

        <div className="col-md-5">
          <div className="card shadow sticky-top" style={{ top: '5px', zIndex: 100, marginTop: '44px' }}>
            <div className="card-body">
              <h5 className="card-title mb-3">
                <FaEnvelopeOpenText className="me-2" /> Enquiry..
              </h5>
              <form onSubmit={handleSubmit}>
                <div className="mb-3">
                  <label className="form-label">Name</label>
                  <input
                    type="text"
                    name="name"
                    className="form-control"
                    required
                    value={formData.name}
                    onChange={handleInputChange}
                  />
                </div>
                <div className="mb-3">
                  <label className="form-label">Email</label>
                  <input
                    type="email"
                    name="email"
                    className="form-control"
                    required
                    value={formData.email}
                    onChange={handleInputChange}
                  />
                </div>
                <div className="mb-3">
                  <label className="form-label">Phone</label>
                  <input
                    type="text"
                    name="phone_number"
                    className="form-control"
                    required
                    value={formData.phone_number}
                    onChange={handleInputChange}
                  />
                </div>
                <button type="submit" className="btn btn-success w-100" disabled={isSubmitting}>
                  {isSubmitting ? (
                    <>
                      <span className="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>
                      Sending...
                    </>
                  ) : (
                    'Submit Enquiry'
                  )}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default DealerCart;
