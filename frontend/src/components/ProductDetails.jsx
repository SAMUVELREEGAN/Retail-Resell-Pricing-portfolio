import { useState, useEffect } from "react";
import { useParams, useLocation, useNavigate } from "react-router-dom";
import { Row, Col, Container, Form, Button } from "react-bootstrap";
import Item from "./Item";
import "../components/ProductDetails.css";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/free-mode";
import "swiper/css/navigation";
import "swiper/css/thumbs";
import { FreeMode, Navigation, Thumbs } from "swiper/modules";
import { FaShareSquare } from "react-icons/fa";
import { useMyContext } from "../context/MyContext";
import axios from "axios";
import { toast } from "react-toastify";

const ProductDetails = () => {
  const [name, setName] = useState("");
  const [phNumber, setPhNumber] = useState("");
  const [email, setEmail] = useState("");
  const [quantity, setQuantity] = useState(1);
  const [isWishlisted, setIsWishlisted] = useState(false);
  const [thumbsSwiper, setThumbsSwiper] = useState(null);

  const { products, BASE_URL } = useMyContext();
  const { id } = useParams();
  const location = useLocation();
  const navigate = useNavigate();

  const [product, setProduct] = useState(null);

  useEffect(() => {
    if (products.length > 0) {
      const foundProduct = products.find((pro) => pro.id.toString() === id);
      if (!foundProduct) {
        navigate("/404");
      } else {
        setProduct(foundProduct);
        if (foundProduct.link_name !== "all") {
          navigate("/404");
        }
      }
    }
  }, [products, id, navigate]);

  const shuffle = (arr) => [...arr].sort(() => 0.5 - Math.random());

  const relatedProducts = product
    ? shuffle(
        products.filter(
          (p) =>
            p.link_name === "all" &&
            p.id !== parseInt(id) &&
            p.category === product.category
        )
      ).slice(0, 8)
    : [];

  const handleSubmit = async (e) => {
    e.preventDefault();

    const enquieryData = new FormData();
    enquieryData.append("quantity", quantity);
    enquieryData.append("name", name);
    enquieryData.append("phone_number", phNumber);
    enquieryData.append("email", email);
    enquieryData.append("Product_id", id);

    try {
      const response = await axios.post(
        "http://192.168.29.61:8000/api/enquiries/enquieryadd/",
        enquieryData,
        {
          headers: { "Content-Type": "multipart/form-data" },
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

  useEffect(() => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  }, [location.pathname]);

  useEffect(() => {
    if (product) {
      const wishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
      const exists = wishlist.find((item) => item.id === product.id);
      setIsWishlisted(!!exists);
    }
  }, [product]);

  const toggleWishlist = () => {
    const wishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
    const exists = wishlist.find((item) => item.id === product.id);
    let updatedWishlist;

    if (exists) {
      updatedWishlist = wishlist.filter((item) => item.id !== product.id);
      setIsWishlisted(false);
    } else {
      updatedWishlist = [...wishlist, product];
      setIsWishlisted(true);
    }

    localStorage.setItem("wishlist", JSON.stringify(updatedWishlist));
  };

  const handleShare = () => {
    const shareData = {
      title: product.pro_name,
      text: `Check out this product: ${product.pro_name}`,
      url: window.location.href,
    };

    if (navigator.share) {
      navigator
        .share(shareData)
        .catch((err) => console.error("Share failed:", err));
    } else {
      const whatsappUrl = `https://wa.me/?text=${encodeURIComponent(
        `${shareData.text} - ${shareData.url}`
      )}`;
      window.open(whatsappUrl, "_blank");
    }
  };

  if (!product) return null;

  const totalPrice = parseFloat(product.price) * quantity;

  return (
    <Container className="product-details-container py-4">
      <Row>
        <Col md={7} className="mb-4" style={{ height: "fit-content" }}>
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
              <span style={{ fontWeight: "900" }}>
                Price :{" "}
                <del className="text-danger">
                  ₹ {parseFloat(product.price) + 200}
                </del>
              </span>{" "}
              ₹{parseFloat(product.price)}
            </h2>
            <p style={{ fontSize: "1.4rem" }}>
              {" "}
              <span style={{ fontWeight: "900" }}>Category :</span>{" "}
              {product.category} ,{" "}
              <span style={{ fontWeight: "900" }}>Size : </span>
              {Array.isArray(product.size)
                ? product.size.join(", ")
                : product.size}
            </p>
            <p className="mt-3" style={{ height: "fit-content" }}>
              {product.description}
            </p>
          </div>
        </Col>

        <Col md={1}></Col>

        <Col md={4}>
          <div className="d-flex flex-wrap justify-content-around  ">
            <button
              onClick={toggleWishlist}
              style={{
                width: "50%",
                backgroundColor: isWishlisted ? "red" : "#f0f0f0",
                color: isWishlisted ? "white" : "black",
                border: "none",
                padding: "10px",
                borderRadius: "5px",
                margin: "10px 0px",
              }}
            >
              {isWishlisted ? "Wishlisted ❤️" : "Add to Wishlist ♡"}
            </button>
            <button
              onClick={handleShare}
              style={{
                background: "#f0f0f0",
                border: "none",
                borderRadius: "5px",
                width: "45%",
                margin: "10px 0px",
              }}
            >
              <span className="me-1">Share</span>
              <FaShareSquare />
            </button>
          </div>

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
                    <strong>
                      Total Price: ₹{totalPrice || parseFloat(product.price)}
                    </strong>
                  </div>
                </div>
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>Name</Form.Label>
                <Form.Control
                  type="text"
                  placeholder="Your name"
                  required
                  onChange={(e) => setName(e.target.value)}
                  value={name}
                />
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>Phone Number</Form.Label>
                <Form.Control
                  type="tel"
                  placeholder="Your phone number"
                  onChange={(e) => setPhNumber(e.target.value)}
                  required
                  value={phNumber}
                />
              </Form.Group>

              <Form.Group className="mb-3">
                <Form.Label>Email</Form.Label>
                <Form.Control
                  type="email"
                  placeholder="Your email"
                  onChange={(e) => setEmail(e.target.value)}
                  required
                  value={email}
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

      <div className="related-products mt-5">
        <h2 className="text-center mb-4">Explore More Products</h2>
        <Row>
          {relatedProducts.length > 0 ? (
            relatedProducts.map((product, i) => (
              <Col
                key={i}
                xs={12}
                sm={6}
                md={4}
                lg={3}
                className="d-flex justify-content-center mb-4"
              >
                <Item product={product} />
              </Col>
            ))
          ) : (
            <div className="text-center py-5">No related products to show.</div>
          )}
        </Row>
      </div>
    </Container>
  );
};

export default ProductDetails;
