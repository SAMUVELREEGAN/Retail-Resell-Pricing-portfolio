 import  { useState, useEffect } from 'react';
import axios from '../axios';
import '../App.css';
import 'bootstrap-icons/font/bootstrap-icons.css';
import { BASE_URL } from "../axios";
import { useMyContext } from '../context/MyContext';

// ✅ Static fallback contact data
const fallbackContactData = {
  adress: "123 Main Street, City, Country",
  ph_number: "+1 (123) 456-7890",
  email: "contact@example.com",
  facebook_url: "https://facebook.com",
  instagram_url: "https://instagram.com",
  youtube_url: "https://youtube.com",
  whatsapp_url: "https://whatsapp.com"
};

// ✅ Static fallback images
const fallbackImages = {
  contact_top_img: "https://img.freepik.com/free-photo/smiling-woman-headset-presentation-something_329181-11710.jpg?w=740",
  contact_bottom_img: "https://img.freepik.com/free-vector/flat-design-illustration-customer-support_23-2148887720.jpg?w=740"
};

function Contact() {
  const [formData, setFormData] = useState({
    name: '', email: '', ph_number: '', subject: '', message: '',
  });
  const [errors, setErrors] = useState({});
  const [status, setStatus] = useState('');
  const [contactImages, setContactImages] = useState(fallbackImages);
  const [isServerOffline, setIsServerOffline] = useState(false);

  const contextData = useMyContext();

  const displayData = isServerOffline ? fallbackContactData : contextData;

  useEffect(() => {
    const fetchImages = async () => {
      try {
        const res = await axios.get("contact-images/");
        setContactImages({
          contact_top_img: `${BASE_URL}${res.data.contact_top_img}`,
          contact_bottom_img: `${BASE_URL}${res.data.contact_bottom_img}`
        });
      } catch {
        setIsServerOffline(true);
      }
    };
    fetchImages();
  }, []);

  const validateField = (name, value) => {
    switch (name) {
      case 'name':
        if (!value.trim()) return 'Name is required';
        if (value.length < 2) return 'Name must be at least 2 characters';
        break;
      case 'email':
        if (!value.trim()) return 'Email is required';
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) return 'Invalid email format';
        break;
      case 'ph_number':
        if (!value.trim()) return 'Phone number is required';
        if (!/^[0-9]{10,15}$/.test(value)) return 'Invalid phone number';
        break;
      case 'subject':
        if (!value.trim()) return 'Subject is required';
        break;
      case 'message':
        if (!value.trim()) return 'Message is required';
        if (value.length < 10) return 'Message must be at least 10 characters';
        break;
      default:
        return '';
    }
    return '';
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
    setErrors(prev => ({ ...prev, [name]: validateField(name, value) }));
  };

  const handleBlur = (e) => {
    const { name, value } = e.target;
    setErrors(prev => ({ ...prev, [name]: validateField(name, value) }));
  };

  const validateForm = () => {
    const newErrors = {};
    let isValid = true;
    Object.entries(formData).forEach(([key, value]) => {
      const err = validateField(key, value);
      if (err) {
        newErrors[key] = err;
        isValid = false;
      }
    });
    setErrors(newErrors);
    return isValid;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) {
      setStatus("Please fix the errors.");
      return;
    }

    try {
      await axios.post(`${BASE_URL}/api/contact-us/`, formData);
      setStatus("Message sent successfully!");
      setFormData({
        name: '', email: '', ph_number: '', subject: '', message: ''
      });
    } catch {
      setStatus("Failed to send message.");
    } finally {
      setTimeout(() => setStatus(''), 3000);
    }
  };

  return (
    <div className="container py-5">
      {isServerOffline && (
        <div className="alert alert-warning text-center mb-4">
          Server offline. Showing fallback contact data and images.
        </div>
      )}

      <div className="row">
        {/* Contact Form */}
        <div className="col-md-6 mb-4">
          <h3 className="mb-4 text-capitalize">Contact Us</h3>
          {status && (
            <div className={`alert ${status.includes("successfully") ? "alert-success" : "alert-danger"}`}>
              {status}
            </div>
          )}
          <form onSubmit={handleSubmit}>
            {['name', 'email', 'ph_number', 'subject', 'message'].map((field, i) => (
              <div className="mb-3" key={i}>
                {field !== 'message' ? (
                  <input
                    className={`form-control ${errors[field] && 'is-invalid'}`}
                    type={field === 'email' ? 'email' : 'text'}
                    name={field}
                    placeholder={`Your ${field.replace('_', ' ')}`}
                    value={formData[field]}
                    onChange={handleChange}
                    onBlur={handleBlur}
                  />
                ) : (
                  <textarea
                    className={`form-control ${errors[field] && 'is-invalid'}`}
                    name="message"
                    rows="4"
                    placeholder="Enter Your Message"
                    value={formData[field]}
                    onChange={handleChange}
                    onBlur={handleBlur}
                  />
                )}
                {errors[field] && <div className="invalid-feedback">{errors[field]}</div>}
              </div>
            ))}
            <button className="btn btn-dark px-4 py-2 mt-2" type="submit">Send Message</button>
          </form>
        </div>

        {/* Top Image */}
        <div className="col-md-6 mb-4 d-flex justify-content-center align-items-center">
          <div className="contact-img w-100">
            <img
              src={contactImages.contact_top_img}
              alt="Contact Top"
              className="img-fluid rounded"
            />
          </div>
        </div>

        {/* Bottom Image */}
        <div className="col-md-6 mb-4 d-flex justify-content-center align-items-center">
          <div className="contact-img w-100">
            <img
              src={contactImages.contact_bottom_img}
              alt="Contact Bottom"
              className="img-fluid rounded"
            />
          </div>
        </div>

        {/* Contact Info */}
        <div className="col-md-6 mb-4 d-flex justify-content-center align-items-center">
          <div className="p-4 w-100 contact-detail" style={{ maxWidth: "500px" }}>
            <h6 style={{display:"flex"}}> <i className="bi bi-geo-alt me-2"></i>   <p className='fw-medium'>
              <a
                href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(displayData.adress)}`}
                target="_blank"
                rel="noopener noreferrer"
                className="text-decoration-none"
              >
                {displayData.adress}
              </a>
            </p></h6>
          
          <h6 style={{display:"flex"}}> <i className="bi bi-telephone me-2"></i> <p>
  <a
    href={`tel:${displayData.ph_number}`}
    className="text-dark text-decoration-none"
  >
    {displayData.ph_number}
  </a>
</p></h6>


<h6 style={{display:"flex"}}><i className="bi bi-envelope me-2"></i> <p>
  <a
    href={`https://mail.google.com/mail/?view=cm&fs=1&to=${displayData.email}`}
    target="_blank"
    rel="noopener noreferrer"
    className="text-dark text-decoration-none"
  >
    {displayData.email}
  </a>
</p></h6>


            <h6>Follow Us</h6>
            <div className="d-flex gap-2 mt-3">
              <a href={displayData.facebook_url} target="_blank" className="social-icon facebook" rel="noopener noreferrer">
                <i className="bi bi-facebook" style={{backgroundColor:"white", padding:"7px 10px", color:"blue", border:"1px solid black" ,borderRadius:"5px"}}></i>
              </a>
              <a href={displayData.instagram_url} target="_blank" className="social-icon instagram" rel="noopener noreferrer">
                <i className="bi bi-instagram" style={{backgroundColor:"white", padding:"7px 10px", color:"#C4285C", border:"1px solid black" ,borderRadius:"5px"}}></i>
              </a>
              <a href={displayData.youtube_url} target="_blank" className="social-icon youtube" rel="noopener noreferrer">
                <i className="bi bi-youtube" style={{backgroundColor:"white", padding:"7px 10px", color:"red", border:"1px solid black" ,borderRadius:"5px"}}></i>
              </a>
              <a href={`https://api.whatsapp.com/send/?phone=${displayData.whatsapp_url}&text&type=phone_number&app_absent=0`} target="_blank" className="social-icon whatsapp" rel="noopener noreferrer">
                <i className="bi bi-whatsapp" style={{backgroundColor:"white", padding:"7px 10px", color:"green", border:"1px solid black" ,borderRadius:"5px"}}></i>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div className="contact-map">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3931.310485174061!2d77.97896547376214!3d9.824268776036451!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b00d253b855851d%3A0x4e3c2e390ba785da!2sVEERARAGAVAN%20FURNITURE%20SHOWROOM!5e0!3m2!1sen!2sin!4v1744031154700!5m2!1sen!2sin"
              width="100%"
              height="400"
              style={{ border: 0 }}
              allowFullScreen=""
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
              title="Contact Location"
            ></iframe>
          </div>
    </div>
  );
}

export default Contact;
