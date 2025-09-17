import { useState, useEffect } from "react";
import { useParams, useLocation } from "react-router-dom";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/free-mode";
import "swiper/css/navigation";
import "swiper/css/thumbs";
import { FreeMode, Navigation, Thumbs } from "swiper/modules";
import { toast } from "react-toastify";
import axios from "axios";
import "react-toastify/dist/ReactToastify.css";
import "../components/CategoryProductDetails.css";
import { useMyContext } from "../context/MyContext";

const CategoryProductDetails = () => {
  const { link_name, id } = useParams();
  const { products, BASE_URL } = useMyContext();
  const location = useLocation();

  const [thumbsSwiper, setThumbsSwiper] = useState(null);
  const [quantity, setQuantity] = useState(1);
  const [name, setName] = useState("");
  const [phNumber, setPhNumber] = useState("");
  const [email, setEmail] = useState("");

  const product = products.find(
    (pro) => pro.id.toString() === id && pro.link_name === link_name
  );

  useEffect(() => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  }, [location.pathname]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const enquiryData = new FormData();
    enquiryData.append("quantity", quantity);
    enquiryData.append("name", name);
    enquiryData.append("phone_number", phNumber);
    enquiryData.append("email", email);
    enquiryData.append("Product_id", id);

    try {
      const response = await axios.post(
        "http://192.168.29.61:8000/api/enquiries/enquieryadd/",
        enquiryData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );

      if (response.status === 201 || response.status === 200) {
        setName("");
        setPhNumber("");
        setEmail("");
        setQuantity(1);
        toast.success(
          "Your enquiry has been sent! We’ll contact you within 24 hours."
        );
      } else {
        toast.error(
          "Failed to send enquiry. Please try again or contact support."
        );
      }
    } catch (error) {
      console.error(error);
      toast.error("Something went wrong. Please try again later.");
    }
  };

  if (!product)
    return <div className="text-center py-5">Product not found</div>;

  const totalPrice = product.price * quantity;

  return (
    <Container className="product-details-container py-4">
      <Row>
        <Col md={7} className="mb-4">
          <Swiper
            style={{
              "--swiper-navigation-color": "#fff",
              "--swiper-pagination-color": "#fff",
            }}
            loop={true}
            spaceBetween={10}
            navigation={true}
            thumbs={{ swiper: thumbsSwiper }}
            modules={[FreeMode, Navigation, Thumbs]}
            className="mySwiper2"
          >
            {/* {Array.isArray(product.pro_img) &&
              product.pro_img.map((img, index) => (
                <SwiperSlide key={index}>
                  <div className="carousel-image-wrapper">
                    <img src={img} alt={`Slide ${index}`} />
                  </div>
                </SwiperSlide>
              ))} */}

            {Array.isArray(product.images) &&
              product.images.map((imgObj, index) => (
                <SwiperSlide key={index}>
                  <div className="carousel-image-wrapper">
                    <img
                      src={imgObj.image ? `${BASE_URL}${imgObj.image}` : ""}
                      alt={`Slide ${index}`}
                    />
                  </div>
                </SwiperSlide>
              ))}
          </Swiper>

          <Swiper
            onSwiper={setThumbsSwiper}
            loop={true}
            spaceBetween={10}
            slidesPerView={4}
            freeMode={true}
            watchSlidesProgress={true}
            modules={[FreeMode, Navigation, Thumbs]}
            className="mySwiper"
          >
            {/* {Array.isArray(product.pro_img) &&
              product.pro_img.map((img, index) => (
                <SwiperSlide key={index}>
                  <div className="carousel-image-wrapper">
                    <img src={img} alt={`Slide ${index}`} className="carousel-img" />
                  </div>
                </SwiperSlide>
              ))} */}

            {Array.isArray(product.images) &&
              product.images.map((imgObj, index) => (
                <SwiperSlide key={index}>
                  <div className="carousel-image-wrapper">
                    <img
                      src={imgObj.image ? `${BASE_URL}${imgObj.image}` : ""}
                      alt={`Thumb ${index}`}
                      className="carousel-img"
                    />
                  </div>
                </SwiperSlide>
              ))}
          </Swiper>

          <div className="mt-3">
            <h2 style={{ color: "#102D59", fontWeight: "700" }}>
              {product.pro_name}
            </h2>
            <h2>
              <del className="text-danger">₹{product.price + 200}</del> ₹
              {product.price}
            </h2>
            <p>{product.category}</p>
            <p className="mt-3">{product.description}</p>
          </div>
        </Col>

        <Col md={1}></Col>

        <Col md={4}>
          <div
            style={{
              backgroundColor: "white",
              padding: "7%",
              boxShadow: "0 4px 16px rgba(0, 0, 0, 0.08)",
            }}
          >
            <h2
              style={{
                color: "#102D59",
                fontWeight: "700",
                textAlign: "center",
              }}
            >
              Enquiry Form
            </h2>
            <Form onSubmit={handleSubmit}>
              <Form.Group className="mb-3">
                <Form.Label>Quantity</Form.Label>
                <div className="d-flex justify-content-between align-items-center">
                  <Form.Control
                    type="number"
                    value={quantity}
                    min={1}
                    onChange={(e) => setQuantity(parseInt(e.target.value))}
                    style={{ maxWidth: "100px" }}
                  />
                  <div className="ms-2">
                    <strong>Total Price: ₹{totalPrice}</strong>
                  </div>
                </div>
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>Name</Form.Label>
                <Form.Control
                  type="text"
                  placeholder="Your name"
                  required
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                />
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>Phone Number</Form.Label>
                <Form.Control
                  type="tel"
                  placeholder="Your phone number"
                  required
                  value={phNumber}
                  onChange={(e) => setPhNumber(e.target.value)}
                />
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>Email</Form.Label>
                <Form.Control
                  type="email"
                  placeholder="Your email"
                  required
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />
              </Form.Group>

              {/* <Form.Group className="mb-3">
                <Form.Check inline label="Reselling" name="usage" type="radio" id="reselling" />
                <Form.Check inline label="End Use" name="usage" type="radio" id="enduse" />
              </Form.Group> */}

              <Button type="submit" style={{ backgroundColor: "#102D59" }}>
                Send Enquiry
              </Button>
            </Form>
          </div>
        </Col>
      </Row>
    </Container>
  );
};

export default CategoryProductDetails;
