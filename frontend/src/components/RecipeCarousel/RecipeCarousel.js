// This component can be used for these two sections in the RecipeIndex:
// Lovely Layer Cakes Carousel
// Trending Recipes Carousel

import React from "react";
import { useState } from "react";
import { CarouselProvider, Slider, Slide, ButtonBack, ButtonNext } from 'pure-react-carousel';
import 'pure-react-carousel/dist/react-carousel.es.css';
import './RecipeCarousel.css'
import { FaChevronLeft, FaChevronRight } from 'react-icons/fa';
import { GrBookmark } from 'react-icons/gr';


export default function RecipeCarousel({recipes}) {

    const [currentSlide, setCurrentSlide] = useState(0);
    const totalSlides = 6;

    const handleSlideChange = (newSlide) => {
        setCurrentSlide(newSlide);
    };

    return (
        <div className="carousel-container">

            {recipes.length === 0 ? null : 
            
            <CarouselProvider
                naturalSlideWidth={120}
                naturalSlideHeight={130}
                totalSlides={6}
                visibleSlides={4}
                dragEnabled = {false}
                currentSlide={currentSlide}
            >
            <Slider className="slides-outer-container">
                <Slide className="slide" index={0}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[0].imageUrl}></img>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipes[0].name}</h3>
                            <p id="author-name">{recipes[0].author}</p>
                            <div id="cooking-time-bookmark">{recipes[0].cookingTime}
                                {<GrBookmark id="slide-bookmark" />}  
                            </div>
                        </div>
                    </div>
                </Slide>
                <Slide className="slide" index={1}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[1].imageUrl}></img>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipes[1].name}</h3>
                            <p id="author-name">{recipes[1].author}</p>
                            <div id="cooking-time-bookmark">{recipes[1].cookingTime}
                                {<GrBookmark id="slide-bookmark" />}  
                            </div>
                        </div>
                    </div>
                </Slide>
                <Slide className="slide" index={2}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[2].imageUrl}></img>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipes[2].name}</h3>
                            <p id="author-name">{recipes[2].author}</p>
                            <div id="cooking-time-bookmark">{recipes[2].cookingTime}
                                {<GrBookmark id="slide-bookmark" />}  
                            </div>
                        </div>
                    </div>
                </Slide>
                <Slide className="slide" index={3}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[3].imageUrl}></img>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipes[3].name}</h3>
                            <p id="author-name">{recipes[3].author}</p>
                            <div id="cooking-time-bookmark-edit">{recipes[3].cookingTime}
                                {<GrBookmark id="slide-bookmark" />}  
                            </div>
                        </div>
                    </div>
                </Slide>
                <Slide className="slide" index={4}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[4].imageUrl}></img>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipes[4].name}</h3>
                            <p id="author-name">{recipes[4].author}</p>
                            <div id="cooking-time-bookmark">{recipes[4].cookingTime}
                                {<GrBookmark id="slide-bookmark" />}  
                            </div>
                        </div>
                    </div>
                </Slide>
                <Slide className="slide" index={5}>
                    <div className="slide-container">
                        <img id="slide-img" src={recipes[5].imageUrl}></img>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipes[5].name}</h3>
                            <p id="author-name">{recipes[5].author}</p>
                            <div id="cooking-time-bookmark-edit">{recipes[5].cookingTime}
                                {<GrBookmark id="slide-bookmark" />}  
                            </div>
                        </div>
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
            }
        </div>
    );
}