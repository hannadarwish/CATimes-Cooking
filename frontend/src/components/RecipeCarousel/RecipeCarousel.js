// This component can be used for these two sections in the RecipeIndex:
// Lovely Layer Cakes Carousel
// Trending Recipes Carousel

import React from "react";
import { useState } from "react";
import { CarouselProvider, Slider, Slide, ButtonBack, ButtonNext } from 'pure-react-carousel';
import 'pure-react-carousel/dist/react-carousel.es.css';
import './RecipeCarousel.css'
import { FaChevronLeft, FaChevronRight } from 'react-icons/fa';


export default function RecipeCarousel({recipes}) {

    const [currentSlide, setCurrentSlide] = useState(0);
    const totalSlides = 6;

    const handleSlideChange = (newSlide) => {
        setCurrentSlide(newSlide);
    };

    if (recipes.length === 0) {
        return null;
    }

    return (
        <div>
            <CarouselProvider
                naturalSlideWidth={120}
                naturalSlideHeight={100}
                totalSlides={6}
                visibleSlides={3}
                dragEnabled = {false}
                currentSlide={currentSlide}
                className="carousel-container"
            >
            <Slider>
                <Slide index={0}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[0].imageUrl}></img>
                        <h3 id="recipe-name">{recipes[0].name}</h3>
                        <p id="author-name">{recipes[0].author}</p>
                    </div>
                </Slide>
                <Slide index={1}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[1].imageUrl}></img>
                        <h3 id="recipe-name">{recipes[1].name}</h3>
                        <p id="author-name">{recipes[1].author}</p>
                    </div>
                </Slide>
                <Slide index={2}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[2].imageUrl}></img>
                        <h3 id="recipe-name">{recipes[2].name}</h3>
                        <p id="author-name">{recipes[2].author}</p>
                    </div>
                </Slide>
                <Slide index={3}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[3].imageUrl}></img>
                        <h3 id="recipe-name">{recipes[3].name}</h3>
                        <p id="author-name">{recipes[3].author}</p>
                    </div>
                </Slide>
                <Slide index={4}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[4].imageUrl}></img>
                        <h3 id="recipe-name">{recipes[4].name}</h3>
                        <p id="author-name">{recipes[4].author}</p>
                    </div>
                </Slide>
                <Slide index={5}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[5].imageUrl}></img>
                        <h3 id="recipe-name">{recipes[5].name}</h3>
                        <p id="author-name">{recipes[5].author}</p>
                    </div>
                </Slide>
            </Slider>
            {currentSlide > 0 && (
                <ButtonBack onClick={() => handleSlideChange(currentSlide - 1)}>
                    { <FaChevronLeft /> }
                </ButtonBack>
            )}
            {currentSlide < totalSlides - 3 && (
                <ButtonNext onClick={() => handleSlideChange(currentSlide + 1)}>
                    { <FaChevronRight /> }
                </ButtonNext>
            )}
            </CarouselProvider>
        </div>
    );
}