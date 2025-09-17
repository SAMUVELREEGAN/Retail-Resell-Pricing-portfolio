import Carousel from 'react-bootstrap/Carousel';
import './CursoleImg.css'; // optional: for styles
import { useMyContext } from '../context/MyContext';
import { Link } from 'react-router-dom';
;


const CursoleImg = () => {
  const {cursoles} = useMyContext();
  return (
    <div>
      <Carousel>
        {cursoles.map((img, index) => (
          <Carousel.Item key={index} interval={2000}>
            <div className="carousel-img-container">
              <Link to={'/product'}>
              <img  src={img.image} alt={`Slide ${index}`} className="w-100 h-60" />
              </Link>
            </div>
          </Carousel.Item>
        ))}
      </Carousel>
    </div>
  );
};

export default CursoleImg;
