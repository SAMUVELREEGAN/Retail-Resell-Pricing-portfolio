 
import { useState, useEffect } from 'react';
// import axios from 'axios';
import './About.css';
import api, { BASE_URL } from "../axios"; 

function About() {
  const [aboutData, setAboutData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchAboutData = async () => {
      try {
        // Use the imported api instance which already has the base URL configured
        const response = await api.get(`${BASE_URL}/api/about-setting/`, {
          timeout: 5000 // 5 second timeout
        });
        setAboutData(response.data);
      } catch (err) {
        console.error('Failed to fetch about data, using fallback:', err.message);
        setError('Connection to server failed - showing default content');
      } finally {
        setLoading(false);
      }
    };
    
    fetchAboutData();
  }, []);

  if (loading) return <div className="text-center mt-5">Loading...</div>;

  return (
    <div className="container py-5">
      {/* Hero Section */}
      <div className="row align-items-center mb-5">
        <div className="col-lg-6 mb-4 mb-lg-0">
          {aboutData ? (
            <img 
              src={`${BASE_URL}${aboutData.about_story_img}`}
              className="img-fluid rounded shadow"
              alt="About Veeraragavan Furnitures"
              style={{maxHeight: "500px", width: "100%", objectFit: "cover"}}
            />
          ) : (
            <img 
              src="https://t3.ftcdn.net/jpg/02/26/14/90/360_F_226149059_XaAkChkpfZfvmPPt4JH5UicqKJH5zLHM.jpg"
              className="img-fluid rounded shadow"
              alt="Default about"
              style={{maxHeight: "500px", width: "100%", objectFit: "cover"}}
            />
          )}
        </div>
        <div className="col-lg-6">
          <h1 className="display-4 mb-4 position-relative">
            About Us
            
          </h1>
          <p className="lead">
            Welcome to Veeraragavan Furnitures — Your trusted destination for wholesale and retail furniture.
          </p>
          <p>
            At Veeraragavan Furnitures, we believe that furniture is more than just a piece — it's a reflection of your taste, comfort, and lifestyle. We're proud to offer both wholesale and retail solutions that cater to every need and budget.
          </p>
        </div>
      </div>

      {/* Who We Are Section */}
      <div className="card mb-5 border-0 shadow">
        <div className="card-body p-4">
          <div className="row align-items-center">
            
            <div className="col-md-8">
              <h2 className="mb-3">Who We Are</h2>
              <p>
                Veeraragavan Furnitures is a leader in the furniture industry, known for quality, style, and affordability. With years of experience, we've built a reputation for excellence in craftsmanship and customer service.
              </p>
            </div>
            <div className="col-md-4 mb-3 mb-md-0">
              {aboutData ? (
                <img 
                  src={`${BASE_URL}${aboutData.designer_img}`}
                  alt="Our Team" 
                  className="img-fluid rounded"
                  style={{maxHeight: "250px", width: "100%", objectFit: "cover"}}
                />
              ) : (
                <img 
                  src="https://t3.ftcdn.net/jpg/02/26/14/90/360_F_226149059_XaAkChkpfZfvmPPt4JH5UicqKJH5zLHM.jpg"
                  alt="Default team" 
                  className="img-fluid rounded"
                  style={{maxHeight: "250px", width: "100%", objectFit: "cover"}}
                />
              )}
            </div>
          </div>
        </div>
      </div>

      {/* Features Section */}
      <div className="row mb-5 about-card">
        {/* What We Offer */}
        <div className="col-md-4 mb-4 mb-md-0 ">
          <div className="card h-100 border-0 shadow">
            <div className="card-body text-center p-4 what-we-offer">
              <div className="mb-3 mx-auto" style={{width: "120px", height: "120px"}}>
              {aboutData? <img 
                  src={`${BASE_URL}${aboutData.card_1_img}`}
                  alt="What We Offer" 
                  className="img-fluid rounded-circle h-100 w-100"
                  style={{objectFit: "cover", border: "3px solid #f8f9fa", boxShadow: "0 2px 4px rgba(0,0,0,0.1)"}}
                />: <img 
                src='https://t3.ftcdn.net/jpg/01/01/89/46/240_F_101894688_RVSZUtDfPR6Cr5eBDQI7Qo5pZ01jmyK3.jpg'
                alt="What We Offer" 
                className="img-fluid rounded-circle h-100 w-100"
                style={{objectFit: "cover", border: "3px solid #f8f9fa", boxShadow: "0 2px 4px rgba(0,0,0,0.1)"}}
              />}
               
              </div>
              <h3 className="mb-3">What We Offer</h3>
              <p>
                A wide variety of modern and traditional furniture. High-quality materials and durable designs.
              </p>
            </div>
          </div>
        </div>

        {/* Our Mission */}
        <div className="col-md-4 mb-4 mb-md-0">
          <div className="card h-100 border-0 shadow">
            <div className="card-body text-center p-4 our-mission">
              <div className="mb-3 mx-auto box-images" style={{width: "120px", height: "120px"}}>
              {aboutData? <img 
                  src={`${BASE_URL}${aboutData.card_2_img}`}
                  alt="What We Offer" 
                  className="img-fluid rounded-circle h-100 w-100"
                  style={{objectFit: "cover", border: "3px solid #f8f9fa", boxShadow: "0 2px 4px rgba(0,0,0,0.1)"}}
                />: <img 
                src='https://t3.ftcdn.net/jpg/01/01/89/46/240_F_101894688_RVSZUtDfPR6Cr5eBDQI7Qo5pZ01jmyK3.jpg'
                alt="What We Offer" 
                className="img-fluid rounded-circle h-100 w-100"
                style={{objectFit: "cover", border: "3px solid #f8f9fa", boxShadow: "0 2px 4px rgba(0,0,0,0.1)"}}
              />}
              </div>
              <h3 className="mb-3">Our Mission</h3>
              <p>
                To deliver premium-quality furniture that blends comfort, durability, and design.
              </p>
            </div>
          </div>
        </div>

        {/* Why Choose Us */}
        <div className="col-md-4">
          <div className="card h-100 border-0 shadow">
            <div className="card-body text-center p-4 why-choose-us">
              <div className="mb-3 mx-auto" style={{width: "120px", height: "120px"}}>
              {aboutData? <img 
                  src={`${BASE_URL}${aboutData.card_3_img}`}
                  alt="What We Offer" 
                  className="img-fluid rounded-circle h-100 w-100"
                  style={{objectFit: "cover", border: "3px solid #f8f9fa", boxShadow: "0 2px 4px rgba(0,0,0,0.1)"}}
                />: <img 
                src='https://t3.ftcdn.net/jpg/01/01/89/46/240_F_101894688_RVSZUtDfPR6Cr5eBDQI7Qo5pZ01jmyK3.jpg'
                alt="What We Offer" 
                className="img-fluid rounded-circle h-100 w-100"
                style={{objectFit: "cover", border: "3px solid #f8f9fa", boxShadow: "0 2px 4px rgba(0,0,0,0.1)"}}
              />}
              </div>
              <h3 className="mb-3">Why Choose Us?</h3>
              <ul className="list-styled text-start d-inline-block ">
                <li className="mb-2 position-relative">Large variety of designs</li>
                <li className="mb-2 position-relative">Competitive pricing</li>
                <li className="mb-2 position-relative">Skilled craftsmanship</li>
                <li className="position-relative">Friendly service</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      {/* Quality Features Section */}
      <div className="my-5">
        <h2 className="text-center mb-5">Made of high quality materials and by highest possible standards</h2>
        
        <div className="row justify-content-center g-4">
          {['Water Resistance', 'Eco Friendly Materials', 'Frost Resistant', 'Easy Assembling', 'Durable Materials'].map((feature, index) => (
            <div key={index} className="col-xl-2 col-lg-2 col-md-4 col-sm-6 col-6 text-center">
              <div className="feature-item p-3">
                <img 
                  src={`https://eskil.qodeinteractive.com/wp-content/uploads/2022/05/h7-icon-0${index + 1}.png`} 
                  alt={feature} 
                  className="img-fluid feature-image mb-3 rounded-circle"
                  width="50"
                  height="50"
                />
                <h5 className="h6 mb-0">{feature.toUpperCase()}</h5>
              </div>
            </div>
          ))}
        </div>
      </div>

      {error && (
        <div className="alert alert-warning text-center">
          Note: {error}. Displaying default content.
        </div>
      )}
    </div>
  );
}

export default About;