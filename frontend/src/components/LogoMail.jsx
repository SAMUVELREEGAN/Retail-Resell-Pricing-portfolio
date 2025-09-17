import React, { useEffect, useState } from 'react';
import { useMyContext } from '../context/MyContext';
import axios from 'axios';

const LogoMail = () => {
  const { BASE_URL } = useMyContext();
  const [dataLogo, setDataLogo] = useState(null);

  useEffect(() => {
    axios.get(`${BASE_URL}/logo/latest/`)
      .then((response) => {
        if (response.data.picture) {
          setDataLogo(`${BASE_URL}${response.data.picture}`);
        } else {
          console.warn("Logo not found in response");
        }
      })
      .catch((error) => {
        console.error('Error fetching logo:', error);
      });
  }, [BASE_URL]);

  if (!dataLogo) return null; // ✅ do not show anything if no image

  return (
    <div>
      <img src={dataLogo} alt="Logo" width="200px" />
    </div>
  );
};

export default LogoMail;
