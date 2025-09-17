import { FaWhatsapp } from 'react-icons/fa';
import './WhatsAppFloat.css';
import { useMyContext } from '../context/MyContext';

const WhatsAppFloat = () => {
  const contextData = useMyContext();
  // console.log(useMyContext()) // to see full context structure


  const defaultNumber = '916380010101';
  const rawNumber = contextData?.whatsapp_url;

  // ✅ Debug log
  // console.log("Context whatsapp_url:", rawNumber);

  // ✅ Clean up the number: fallback to default if invalid
  const cleanNumber = rawNumber && /^\d{10,15}$/.test(rawNumber.toString())
    ? rawNumber.toString()
    : defaultNumber;

  const whatsappLink = `https://wa.me/${cleanNumber}`;

  return (
    <div className="whatsapp-float">
      <a
        href={whatsappLink}
        target="_blank"
        rel="noopener noreferrer"
        aria-label="Chat on WhatsApp"
      >
        <FaWhatsapp />
      </a>
    </div>
  );
};

export default WhatsAppFloat;
