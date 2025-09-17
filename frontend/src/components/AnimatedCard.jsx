 import  { useEffect } from 'react';
import './AnimatedCard.css';
import AOS from 'aos';
import 'aos/dist/aos.css';
import bgImage from '../assets/ani.jpg'; // Use your image here

const AnimatedCard = () => {
  useEffect(() => {
    AOS.init({ duration: 1000 });
  }, []);

  return (
    <div className="snap-container">
      <section
        className="snap-slide"
        style={{ backgroundImage: `url(${bgImage})` }}
      >
        <div className="snap-content" data-aos="fade-up">
          <h1>Premium Quality Fabrics</h1>
          <p>Explore our finest collection of durable, stylish, and comfortable fabrics for every need.</p>
        </div>
      </section>
    </div>
  );
};

export default AnimatedCard;
