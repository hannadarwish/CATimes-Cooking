import './RecipeBox.css'
import { useSelector, useDispatch } from 'react-redux';
import { GrBookmark } from 'react-icons/gr';
import { getRecipes,fetchSavedRecipes } from '../../store/recipes';
import { useEffect } from 'react';

function RecipeBox() {
    
    const recipes = useSelector(getRecipes)
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchSavedRecipes());
    }, [dispatch]);

    return (
        <div className="recipe-box-container">
            <div className="recipe-box-sidebar">
                <h3 id="saved-recipes-text">Saved Recipes</h3>
                <div id="recipe-box-sidebar-categories">
                    <h3>By Category</h3>
                    Categories and Images
                </div>
            </div>
            <div className="saved-recipes-container">
                <h1>Saved Recipes</h1>
                <h3 id="num-recipes">(number of recipes)</h3>
                {recipes.map((recipe) => (
                    <div className="slide-container">
                        <a href={`/recipes/${recipe.id}`}>
                            <img id="slide-img" src={recipe.imageUrl}></img>
                        </a>
                        <div className="slide-content">
                            <h3 id="recipe-name">{recipe.name}</h3>
                            <p id="author-name">{recipe.author}</p>
                            <div id="cooking-time-bookmark">{recipe.cookingTime}
                                {<GrBookmark id="slide-bookmark" />}  
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    )
}

export default RecipeBox;