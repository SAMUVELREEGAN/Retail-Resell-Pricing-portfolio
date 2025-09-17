import { createContext, useContext, useEffect, useState } from "react";
import axios from "axios";
import pic1 from "../assets/pro1.jpg"; // import your fallback image

const MyContext = createContext();

export const useMyContext = () => useContext(MyContext);

export const MyContextProvider = ({ children }) => {
  const [categories, setCategories] = useState([]);
  const [colorList, setColorList] = useState([]);
  const [typeList, setTypeList] = useState([]);
  const [webLinks, setWebLinks] = useState([]);
  const [products, setProducts] = useState([]);
  const [size, setSizes] = useState([]);
  const [error, setError] = useState(null);
  const [cursoles, setCursoles] = useState([]);
  const [reviews, setReviews] = useState([]);

  // contactInfo

  const [adress, SetAddress] = useState([]);
  const [ph_number, SetPhoneNumber] = useState([]);
  const [email, SetEmail] = useState([]);
  const [facebook_url, SetFacebook] = useState([]);
  const [instagram_url, SetInstagram] = useState([]);
  const [youtube_url, SetYoutube] = useState([]);
  const [whatsapp_url, SetWhatsapp] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const categoriesRes = await axios.get(
          "http://192.168.29.61:8000/api/categories/"
        );
        setCategories(categoriesRes.data);

        const colorsRes = await axios.get(
          "http://192.168.29.61:8000/api/colors/"
        );
        setColorList(colorsRes.data);

        const typesRes = await axios.get(
          "http://192.168.29.61:8000/api/types/"
        );
        setTypeList(typesRes.data);

        const webLinksRes = await axios.get(
          "http://192.168.29.61:8000/api/weblinks/"
        );
        setWebLinks(webLinksRes.data);

        const productsRes = await axios.get(
          "http://192.168.29.61:8000/api/product/"
        );
        setProducts(productsRes.data.products);

        const sizesRes = await axios.get(
          "http://192.168.29.61:8000/api/sizes/"
        );
        setSizes(sizesRes.data);

        const carsoulRes = await axios.get(
          "http://192.168.29.61:8000/api/carousel/"
        );
        setCursoles(carsoulRes.data);
        const Web_review = await axios.get(
          "http://192.168.29.61:8000/api/reviews/"
        );
        setReviews(Web_review.data);
        console.log(Web_review.data);

        const response = await axios.get(
          "http://192.168.29.61:8000/api/info/list/"
        );
        const infoList = response.data;

        const emails = infoList.map((item) => item.email);
        const phoneNumbers = infoList.map((item) => item.ph_number);
        const addresses = infoList.map((item) => item.adress);
        const facebookUrls = infoList.map((item) => item.facebook_url);
        const instagramUrls = infoList.map((item) => item.instagram_url);
        const youtubeUrls = infoList.map((item) => item.youtube_url);
        const whatsappUrls = infoList.map((item) => item.whatsapp_url);

        SetAddress(addresses);
        SetEmail(emails);
        SetPhoneNumber(phoneNumbers);
        SetFacebook(facebookUrls);
        SetInstagram(instagramUrls);
        SetYoutube(youtubeUrls);
        SetWhatsapp(whatsappUrls);
      } catch (err) {
        console.error("Error fetching data:", err);
        setError("Failed to fetch data, using default product.");

        // Set fallback default data
        setCategories([{ id: 1, categorie: "default-category" }]);
        setColorList([{ id: 1, color_name: "default-color" }]);
        setTypeList([{ id: 1, type_name: "default-type" }]);
        setProducts([
          {
            id: "aaa",
            pro_name: "Default Product",
            description: "This is a default product description.",
            price: 1110,
            size: "M",
            images: [],
            category: "default-category",
            color: "default-color",
            type: "default-type",
            link_name: "all",
            star: "yes",
          },
          {
            id: "bbbb",
            pro_name: "Default Product",
            description: "This is a default product description.",
            price: 1110,
            size: "M",
            images: [],
            category: "default-category",
            color: "default-color",
            type: "default-type",
            link_name: "all",
            star: "yes",
          },
          {
            id: "ccc",
            pro_name: "Default Product",
            description: "This is a default product description.",
            price: 1110,
            size: "M",
            images: [],
            category: "default-category",
            color: "default-color",
            type: "default-type",
            link_name: "all",
            star: "yes",
          },
          {
            id: "ddd",
            pro_name: "Default Product",
            description: "This is a default product description.",
            price: 1110,
            size: "M",
            images: [],
            category: "default-category",
            color: "default-color",
            type: "default-type",
            link_name: "all",
            star: "yes",
          },
        ]);
        setSizes([]);
      }
    };

    fetchData();
  }, []);

  const BASE_URL = "http://192.168.29.61:8000";

  const CraftUrl = "http://192.168.29.61:8000/api/craft/";

  return (
    <MyContext.Provider
      value={{
        categories,
        colorList,
        typeList,
        webLinks,
        products,
        size,
        error,
        BASE_URL,
        pic1,
        CraftUrl,
        cursoles,
        adress,
        ph_number,
        email,
        facebook_url,
        instagram_url,
        youtube_url,
        whatsapp_url,
        reviews,
      }}
    >
      {children}
    </MyContext.Provider>
  );
};
