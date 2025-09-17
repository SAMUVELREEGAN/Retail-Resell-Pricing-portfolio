import { Container, Row, Col } from 'react-bootstrap';
import './Footer.css';
import logo from '../assets/logo.png';
import { useMyContext } from '../context/MyContext';
import { useEffect, useState } from 'react';
import axios from 'axios';

const Footer = () => {
    const [DataLogo, setDataLogo] = useState("");
  const {adress,
      ph_number,
      email,
      facebook_url,
      instagram_url,
      youtube_url,
      whatsapp_url,BASE_URL} = useMyContext();


        useEffect(() => {
    axios.get(`${BASE_URL}/logo/latest/`)
      .then((response) => {
        if (response.data.picture) {
          setDataLogo(`${BASE_URL}${response.data.picture}`);
        }
      })
      .catch((error) => console.error('Error fetching logo:', error));
  }, [BASE_URL]);
  return (
    <footer className="custom-footer">
      <Container fluid className="p-0">
        <div className="footer-wrapper">
          <div className="footer-left">
            <div className="footer-logo-info text-center p-4">
             {DataLogo ? (
              <img src={DataLogo} alt='Logo' width="200px" />
            ) : (
              <img src={logo} alt='Logo' width="200px" />
            )}
              <p className="footer-description">
                We are committed to providing the best quality furniture with exceptional design.
                Crafted with precision and care, each piece reflects our dedication to excellence.
              </p>
            </div>
          </div>
          <div className="footer-right">
            <Container>
              <Row>
                <Col md={4} sm={12} className="mb-4">
                  <h5 className="text-white">Quick Links</h5>
                  <ul className="list-unstyled">
                    <li><a href="/" className="footer-link">Home</a></li>
                    <li><a href="/about" className="footer-link">About</a></li>
                    <li><a href="/product" className="footer-link">Products</a></li>
                    <li><a href="/contact" className="footer-link">Contact</a></li>
                  </ul>
                </Col>
                <Col md={4} sm={12} className="mb-4">
                  <h5 className="text-white">Follow Us</h5>
                  <ul className="list-unstyled">
                    <li><a href={`${facebook_url}`} className="footer-link">Facebook</a></li>
                    <li><a href={`${youtube_url}`} className="footer-link">YouTube</a></li>
                    <li><a href={`${instagram_url}`} className="footer-link">Instagram</a></li>
                    <li><a href={`${whatsapp_url}`} className="footer-link">WhatsApp</a></li>
                  </ul>
                </Col>
                <Col md={4} sm={12}>
                  <h5 className="text-white">Contact</h5>
       <p className="text-white mb-1">
  Email:
  <a
    href={`https://mail.google.com/mail/?view=cm&fs=1&to=${email}`}
    target="_blank"
    rel="noopener noreferrer"
    className="text-white text-decoration-none ms-1"
  >
    {email}
  </a>
</p>


<p className="text-white mb-1">
  Phone: <a href={`tel:${ph_number}`} className="text-white text-decoration-none">{ph_number}</a>
</p>

<p className="text-white">
  Address: 
  <a 
    href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(adress)}`} 
    target="_blank" 
    rel="noopener noreferrer" 
    className="text-white text-decoration-none ms-1"
  >
    {adress}
  </a>
</p>

                </Col>
              </Row>
              <hr className="border-light" />
              <p className="text-center text-white mb-0">
                &copy; {new Date().getFullYear()} All rights reserved.
              </p>
            </Container>
          </div>
        </div>
      </Container>
    </footer>
  );
};

export default Footer;
