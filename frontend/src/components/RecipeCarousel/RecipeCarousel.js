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
import { useDispatch } from "react-redux";
import { saveRecipe, deleteSavedRecipe} from "../../store/savedRecipes";


export default function RecipeCarousel({recipes}) {

    const [currentSlide, setCurrentSlide] = useState(0);
    const totalSlides = 6;

    const handleSlideChange = (newSlide) => {
        setCurrentSlide(newSlide);
    };

    const dispatch = useDispatch();

    const handleBookmarkClick = (saved, recipeId) => {
        if (saved) {
            dispatch(deleteSavedRecipe(recipeId));
        } else {
            dispatch(saveRecipe(recipeId));
        }
    }

    return (
        <div className="carousel-container">

            {recipes.length === 0 ? null : 
            
            <CarouselProvider
                naturalSlideWidth={120}
                naturalSlideHeight={135}
                totalSlides={6}
                visibleSlides={4}
                dragEnabled = {false}
                currentSlide={currentSlide}
            >
            <Slider className="slides-outer-container">
                {recipes.map((recipe, index) => (
                    <Slide className="slide" index={index} key={index}>
                    <div className="slide-container">
                        <a href={`/recipes/${recipe.id}`}>
                            <img id="slide-img" src={recipe.imageUrl}></img>
                        </a>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipe.name}</h3>
                            <p id="author-name">{recipe.author}</p>
                            <div id="cooking-time-bookmark">{recipe.cookingTime}
                                {<GrBookmark
                                    id="slide-bookmark"
                                    onClick={() => handleBookmarkClick(recipe.saved, recipe.id)}
                                />}  
                            </div>
                        </div>
                    </div>
                </Slide>
                ))}
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