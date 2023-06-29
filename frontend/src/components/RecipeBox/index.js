import './RecipeBox.css'
import { useSelector, useDispatch } from 'react-redux';
import { GrBookmark } from 'react-icons/gr';
import { getRecipes,fetchSavedRecipes } from '../../store/recipes';
import { useEffect } from 'react';

function RecipeBox() {
    
    const recipes = useSelector(getRecipes);
    let numRecipes = recipes.length;
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
                                <div id="cooking-time-bookmark">
                                    {recipe.cookingTime}
                                    {<GrBookmark id="slide-bookmark" />}
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