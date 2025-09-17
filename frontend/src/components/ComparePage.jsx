 import  { useMemo } from 'react';
import { useLocation } from 'react-router-dom';
import './ComparePage.css';
import { useMyContext } from '../context/MyContext';

const ComparePage = () => {
  const { BASE_URL, pic1 } = useMyContext();

  const getProductImage = (product) => {
    if (product.images && product.images.length > 0) {
      const imgPath = product.images[0].image;
      return `${BASE_URL}${imgPath.startsWith('/') ? '' : '/'}${imgPath}`;
    }
    return pic1;
  };

  const location = useLocation();
  const products = useMemo(() => location.state?.products || [], [location.state]);

  const attributes = [
    { label: "Image", key: "pro_img" },
    { label: "Name", key: "pro_name" },
    { label: "Material", key: "type" },
    { label: "Color", key: "color" },
    { label: "Price", key: "price" },
    { label: "Description", key: "description" }
  ];

  return (
    <div className="compare-page container py-5">
      <h2 className="text-center mb-5">Compare Products</h2>

      {products.length > 0 ? (
        <div className="table-responsive">
          <table className="table table-bordered text-center align-middle compare-table">
            <thead className="table-light">
              <tr>
                <th>Feature</th>
                {products.map((_, i) => (
                  <th key={i}>Product {i + 1}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {attributes.map((attr, index) => (
                <tr key={index} className={`row-${attr.key}`}>
                  <td><strong>{attr.label}</strong></td>
                  {products.map((product, i) => (
                    <td key={i}>
                      {attr.key === "pro_img" ? (
                        <img
                          src={getProductImage(product)}
                          alt={product.pro_name}
                          style={{ maxHeight: '150px', objectFit: 'contain', width: '100%' }}
                        />
                      ) : attr.key === "price" ? (
                        `₹${product[attr.key]}`
                      ) : (
                        product[attr.key]
                      )}
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p className="text-center">No products to compare.</p>
      )}
    </div>
  );
};

export default ComparePage;
