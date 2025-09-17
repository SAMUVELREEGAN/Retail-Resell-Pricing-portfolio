import './App.css';
import { Route, Routes } from 'react-router-dom';

import Home from './Pages/Home';
import MyLayout from './Layouts/MyLayout';
import Products from './Pages/Products';
import ProductDetails from './components/ProductDetails';
import CategoryProduct from './components/CategoryProduct';
import ComparePage from './components/ComparePage';
import Wishlist from './components/Wishlist';
import About from './components/About';
import Contact from './components/Contact';
import CategoryProductDetails from './components/CategoryProductDetails';
import NotFound from './Pages/NotFound';

import 'react-toastify/dist/ReactToastify.css';
import { ToastContainer } from 'react-toastify';
import WhatsAppFloat from './components/WhatsAppFloat';
import DealerCart from './components/DealerCart';

function App() {
  return (
    <div className="App">
      <Routes>
        {/* Main Layout Routes */}
        <Route path='/' element={<MyLayout />}>
          <Route index element={<Home />} />
          <Route path='product' element={<Products />} />
          <Route path='about' element={<About />} />
          <Route path='contact' element={<Contact />} />
          <Route path='product/:id' element={<ProductDetails />} />
          <Route path='products/:categorie' element={<CategoryProduct />} />
          <Route path='compare' element={<ComparePage />} />
          <Route path='wishlist' element={<Wishlist />} />
        </Route>

        {/* Dealer Routes */}
        <Route path='/dealer/:link_name' element={<CategoryProduct />} />
        <Route path='/dealer/:link_name/:id' element={<CategoryProductDetails />} />
        <Route path='/dealer/:link_name/cart' element={<DealerCart />}></Route>

        {/* Fallback 404 Route */}
        <Route path="/not-found" element={<NotFound />} />
        <Route path='*' element={<NotFound />} />

   
      </Routes>
     <WhatsAppFloat />
       <ToastContainer position="top-right" autoClose={3000} />
    </div>
  );
}

export default App;
