import './RecipeBox.css'
import { useSelector, useDispatch } from 'react-redux';
import { GoBookmark, GoBookmarkFill } from 'react-icons/go';
import { getRecipes,fetchSavedRecipes } from '../../store/recipes';
import { useEffect } from 'react';
import { deleteSavedRecipe, saveRecipe } from '../../store/savedRecipes';
import CategorySidebar from '../CategorySidebar';
import { AiFillGithub, AiFillLinkedin } from 'react-icons/ai';

function RecipeBox() {
    
    const recipes = useSelector(getRecipes);
    const savedRecipes = recipes.filter((recipe) => recipe.saved === true);

    let numRecipes = savedRecipes.length;
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
        <>
        <div className="recipe-box-container">
            <div className="recipe-box-sidebar">
                <div id="sidebar-saved-recipes-text-container">
                    <h3 id="saved-recipes-text"> <GoBookmarkFill/> Saved Recipes</h3>
                </div>
                <div id="recipe-box-sidebar-categories">
                    <h3 id="by-category-text">BY CATEGORY</h3>
                    <CategorySidebar />
                </div>
            </div>
            <div className="saved-recipes-container">
                <div className="title-container">
                    <h1 id="saved-recipes-box-text">Saved Recipes</h1>
                    <br/>
                    <h3 id="num-recipes-box">{numRecipes} recipes</h3>
                </div>
                <div className="grid-container">
                    {savedRecipes.map((recipe) => (
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
        <div className="about-us-container">
                <div id="about-us-text">
                    <h3>ABOUT US</h3>
                    <p>
                    CFT Cooking is a subscription service of The Chew Fork Times. It is a digital cookbook and cooking guide alike, available on all platforms, that helps home cooks of every level discover, save and organize the world’s best recipes, while also helping them become better, more competent cooks. Subscribe now for full access.
                    </p>
                    <br/>
                    <div id="links-container">
                        <a href="https://github.com/hannadarwish">
                            {<AiFillGithub />}
                        </a>
                        <a href="https://www.linkedin.com/in/hanna-darwish-89a34777/">
                            {<AiFillLinkedin />}
                        </a>
                    </div>
                </div>
                <div id="links-section">
                    {/* Links Section */}
                </div>
            </div>
    </>
    );
}

export default RecipeBox;