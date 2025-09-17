import pic2 from '../assets/404.gif';
import './NotFound.css'; // CSS in separate file

const NotFound = () => {
  return (
    <div className="notfound-container">
      <div className="notfound-content">
        <img src={pic2} alt="404 Not Found" className="notfound-image" />
        <h1 className="notfound-title">Oops! Page Not Found</h1>
        <p className="notfound-text">
          The page you are looking for doesn't exist or has been moved.
        </p>
        <a href="/" className="notfound-home">Go Back Home</a>
      </div>
    </div>
  );
};

export default NotFound;
