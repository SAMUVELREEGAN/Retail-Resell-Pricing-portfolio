 import  { useRef, useState, useEffect } from 'react'
// import { reviews } from '../Data/review'
import './Reviews.css'
import { FaChevronLeft } from "react-icons/fa";
import { FaChevronRight } from "react-icons/fa";
import { useMyContext } from '../context/MyContext';

const Reviews = () => {
  const {reviews} = useMyContext()
  const scrollRef = useRef(null)
  const [showLeft, setShowLeft] = useState(false)
  const [showRight, setShowRight] = useState(false)

  useEffect(() => {
    const scrollEl = scrollRef.current
    if (!scrollEl) return

    const updateButtons = () => {
      setShowLeft(scrollEl.scrollLeft > 0)
      setShowRight(scrollEl.scrollLeft + scrollEl.clientWidth < scrollEl.scrollWidth)
    }

    updateButtons()
    scrollEl.addEventListener('scroll', updateButtons)
    window.addEventListener('resize', updateButtons)

    return () => {
      scrollEl.removeEventListener('scroll', updateButtons)
      window.removeEventListener('resize', updateButtons)
    }
  }, [])

  const scrollLeft = () => {
    scrollRef.current.scrollBy({ left: -420, behavior: 'smooth' }) // 400px card + 20px gap
  }

  const scrollRight = () => {
    scrollRef.current.scrollBy({ left: 420, behavior: 'smooth' })
  }

  return (

<div>
    <h1 className='text-center'>Our Top Reviews</h1>
        <div className="reviews-wrapper">
      {showLeft && (
        <button className="scroll-btn1 left" onClick={scrollLeft} aria-label="Scroll Left" style={{alignItems:"center"}}>
         <FaChevronLeft />
        </button>
      )}
      <div className="reviews-container" ref={scrollRef}>
        {reviews.map(({ id, profile_pic, profile_name, message, point }) => (
          <div key={id} className="review-card">
            <div className="profile-info">
              <img src={profile_pic} alt={profile_name} className="profile-pic" />
              <h4 className="profile-name">{profile_name}</h4>
            </div>
            <div className="stars">
              {[1, 2, 3, 4, 5].map((star) => (
                <svg
                  key={star}
                  xmlns="http://www.w3.org/2000/svg"
                  fill={star <= point ? '#f5c518' : '#fff'}
                  stroke="#f5c518"
                  viewBox="0 0 24 24"
                  className="star-icon"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={1}
                    d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
                  />
                </svg>
              ))}
            </div>
            <p className="review-message">"{message}"</p>
          </div>
        ))}
      </div>
      {showRight && (
        <button className="scroll-btn1 right" onClick={scrollRight} aria-label="Scroll Right">
        <FaChevronRight />
        </button>
      )}
    </div>
</div>
  )
}

export default Reviews
