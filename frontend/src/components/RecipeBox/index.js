import './RecipeBox.css'
import { useSelector, useDispatch } from 'react-redux';
import { GoBookmark, GoBookmarkFill } from 'react-icons/go';
import { getRecipes,fetchSavedRecipes } from '../../store/recipes';
import { useEffect } from 'react';
import { deleteSavedRecipe, saveRecipe } from '../../store/savedRecipes';
import { useState } from 'react';

function RecipeBox() {
    
    const recipes = useSelector(getRecipes);
    let numRecipes = recipes.length;
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchSavedRecipes());
    }, [dispatch]);

    const handleBookmarkClick = (saved, recipeId) => {
        if (saved) {
            dispatch(deleteSavedRecipe(recipeId))
            .then(() => dispatch(fetchSavedRecipes()))
        } else {
            dispatch(saveRecipe(recipeId));
        }
    }

    const toggleBookmarkIcon = (saved) => {
        return saved ? <GoBookmarkFill id="slide-bookmark" /> : <GoBookmark id="slide-bookmark" />;
    };

    return (
        <div className="recipe-box-container">
            <div className="recipe-box-sidebar">
                <div id="sidebar-saved-recipes-text-container">
                    <h3 id="saved-recipes-text"> <GoBookmarkFill/> Saved Recipes</h3>
                </div>
                <div id="recipe-box-sidebar-categories">
                    <h3 id="by-category-text">BY CATEGORY</h3>
                    Categories and Images
                </div>
            </div>
            <div className="saved-recipes-container">
                <div className="title-container">
                    <h1 id="saved-recipes-box-text">Saved Recipes</h1>
                    <br/>
                    <h3 id="num-recipes-box">{numRecipes} recipes</h3>
                </div>
                <div className="grid-container">
                    {recipes.map((recipe) => (
                        <div className="slide-container" key={recipe.id}>
                            <a href={`/recipes/${recipe.id}`}>
                                <img id="slide-img-recipe-box" src={recipe.imageUrl} alt={recipe.name} />
                            </a>
                            <div className="slide-content">
                                <h3 id="recipe-name">{recipe.name}</h3>
                                <p id="author-name">{recipe.author}</p>
                                <div id="cooking-time-bookmark" onClick={() => handleBookmarkClick(recipe.saved, recipe.id)}>
                                    {recipe.cookingTime}
                                    {toggleBookmarkIcon(recipe.saved)}
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}

export default RecipeBox;