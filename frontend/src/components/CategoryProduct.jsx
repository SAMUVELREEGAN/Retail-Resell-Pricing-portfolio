 import  { useEffect, useState } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import CategoryItem from './CategoryItem';
import { Container, Row, Col } from 'react-bootstrap';
import './CategoryProduct.css';
import logo from '../assets/logo.png';
import { useMyContext } from '../context/MyContext';
import { FaChevronLeft, FaChevronRight } from 'react-icons/fa';

const CategoryProduct = () => {
  const { categories, colorList, typeList, products } = useMyContext();
  const { categorie, link_name } = useParams();
  const [materialType, setMaterialType] = useState('');
  const [sortOption, setSortOption] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('');
  const [selectedColor, setSelectedColor] = useState('');
  const [filteredProducts, setFilteredProducts] = useState([]);
  const [compareProducts, setCompareProducts] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [cartItems, setCartItems] = useState([]);
  const itemsPerPage = 21;
  const navigate = useNavigate();
  const location = useLocation();

  const isDealerPage = location.pathname.startsWith('/dealer');
  const CART_KEY = 'dealer_cart';

  const getCart = () => {
    try {
      return JSON.parse(localStorage.getItem(CART_KEY)) || [];
    } catch {
      return [];
    }
  };

  const saveCart = (cart) => {
    localStorage.setItem(CART_KEY, JSON.stringify(cart));
  };

  useEffect(() => {
    window.scrollTo({ top: 0 });
    const saved = getCart();
    setCartItems(saved);
  }, []);

  useEffect(() => {
    let filtered = products;

    if (selectedCategory) {
      filtered = filtered.filter((pro) => pro.category === selectedCategory);
    }

    if (categorie && link_name) {
      filtered = filtered.filter(
        (pro) => pro.category === categorie && pro.link_name === link_name
      );
    } else if (categorie) {
      filtered = filtered.filter(
        (pro) => pro.category === categorie && pro.link_name === 'all'
      );
    } else if (link_name) {
      filtered = filtered.filter((pro) => pro.link_name === link_name);
    }

    if (materialType) {
      filtered = filtered.filter(
        (pro) => pro.type?.toLowerCase() === materialType.toLowerCase()
      );
    }

    if (selectedColor) {
      filtered = filtered.filter(
        (pro) => pro.color?.toLowerCase() === selectedColor.toLowerCase()
      );
    }

    if (sortOption === 'lowToHigh') {
      filtered = filtered.sort((a, b) => a.price - b.price);
    } else if (sortOption === 'highToLow') {
      filtered = filtered.sort((a, b) => b.price - a.price);
    }

    setFilteredProducts(filtered);
    setCurrentPage(1);
  }, [categorie, link_name, materialType, sortOption, selectedCategory, selectedColor, products]);

  const handleAddToCart = (product) => {
    const exists = cartItems.find((item) => item.id === product.id);
    let updatedCart;

    if (exists) {
      updatedCart = cartItems.filter((item) => item.id !== product.id);
    } else {
      updatedCart = [...cartItems, product];
    }

    setCartItems(updatedCart);
    saveCart(updatedCart);
  };

  const totalPages = Math.ceil(filteredProducts.length / itemsPerPage);

  const currentProducts = filteredProducts.slice(
    (currentPage - 1) * itemsPerPage,
    currentPage * itemsPerPage
  );

  const goToPreviousPage = () => {
    setCurrentPage((page) => Math.max(page - 1, 1));
  };

  const goToNextPage = () => {
    setCurrentPage((page) => Math.min(page + 1, totalPages));
  };

  const goToPage = (page) => {
    setCurrentPage(page);
  };

  const handleCompare = (product) => {
    const isAlreadyCompared = compareProducts.some((p) => p.id === product.id);

    if (isAlreadyCompared) {
      setCompareProducts((prev) => prev.filter((p) => p.id !== product.id));
    } else {
      if (compareProducts.length >= 2) {
        alert('You can only compare two products at a time.');
        return;
      }
      setCompareProducts((prev) => [...prev, product]);
    }
  };

  useEffect(() => {
    if (compareProducts.length === 2) {
      navigate('/compare', { state: { products: compareProducts } });
    }
  }, [compareProducts, navigate]);

  return (
    <>
      <div className="filter-container">
        <div className="filter-bar">
          {isDealerPage && (
            <img src={logo} alt="Logo" className="filter-logo" />
          )}
            
          <div className="filter-scroll">
            <div className="filter-group">
              <label htmlFor="materialType" className="filter-name">Material Type:</label>
              <select
                id="materialType"
                className="filter-select"
                onChange={(e) => setMaterialType(e.target.value)}
                value={materialType}
              >
                <option value="">All Material</option>
                {typeList.map((item) => (
                  <option key={item.id} value={item.type_name}>
                    {item.type_name.charAt(0).toUpperCase() + item.type_name.slice(1)}
                  </option>
                ))}
              </select>
            </div>

            <div className="filter-group">
              <label htmlFor="sortBy" className="filter-name">Sort By:</label>
              <select
                id="sortBy"
                className="filter-select"
                onChange={(e) => setSortOption(e.target.value)}
                value={sortOption}
              >
                <option value="">Recommended</option>
                <option value="lowToHigh">Price: Low to High</option>
                <option value="highToLow">Price: High to Low</option>
              </select>
            </div>

            {isDealerPage && (
              <div className="filter-group">
                <label htmlFor="category" className="filter-name">Category:</label>
                <select
                  id="category"
                  className="filter-select"
                  onChange={(e) => setSelectedCategory(e.target.value)}
                  value={selectedCategory}
                >
                  <option value="">All Categories</option>
                  {categories.map((item, index) => (
                    <option key={index} value={item.categorie}>
                      {item.categorie.charAt(0).toUpperCase() + item.categorie.slice(1)}
                    </option>
                  ))}
                </select>
              </div>
            )}

            <div className="filter-group">
              <label htmlFor="color" className="filter-name">Color:</label>
              <select
                id="color"
                className="filter-select"
                onChange={(e) => setSelectedColor(e.target.value)}
                value={selectedColor}
              >
                <option value="">All Colors</option>
                {colorList.map((colorObj) => (
                  <option key={colorObj.id} value={colorObj.color_name}>
                    {colorObj.color_name.charAt(0).toUpperCase() + colorObj.color_name.slice(1).toLowerCase()}
                  </option>
                ))}
              </select>
            </div>
          </div>

        {isDealerPage && (
            <button
              className="cart-button"
              onClick={() => navigate(`/dealer/${link_name}/cart`)}
            >
              Total  ({cartItems.length})
            </button>
          )}
        </div>
      </div>

      <Container className="product-container">
        <Row>
          {currentProducts.map((product, i) => {
            const isCompared = compareProducts.some((p) => p.id === product.id);
            const inCart = cartItems.some((p) => p.id === product.id);
            return (
              <Col key={i} xs={12} sm={6} md={6} lg={4} className="product-col">
                <CategoryItem
                  product={product}
                  onCompare={handleCompare}
                  isCompared={isCompared}
                  isDealerPage={isDealerPage}
                  onAddToCart={handleAddToCart}
                  inCart={inCart}
                />
              </Col>
            );
          })}
        </Row>

        <div className="pagination">
          <button
            onClick={goToPreviousPage}
            disabled={currentPage === 1}
            className="page-button"
            aria-label="Previous Page"
          >
            <FaChevronLeft />
          </button>

          {[...Array(totalPages)].map((_, index) => {
            const page = index + 1;
            return (
              <button
                key={page}
                onClick={() => goToPage(page)}
                className={`page-button ${currentPage === page ? 'active' : ''}`}
                aria-current={currentPage === page ? 'page' : undefined}
              >
                {page}
              </button>
            );
          })}

          <button
            onClick={goToNextPage}
            disabled={currentPage === totalPages}
            className="page-button"
            aria-label="Next Page"
          >
            <FaChevronRight />
          </button>
        </div>
      </Container>
    </>
  );
};

export default CategoryProduct;