
import './RecipeShow.css'
import { useDispatch, useSelector } from 'react-redux';
import { fetchRecipe, getRecipe } from '../../store/recipes';
import { useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import CookingNotesForm from '../CookingNotesForm';
import CookingNotesIndex from '../CookingNotesIndex';

export default function RecipeShow() {

    const { recipeId } = useParams();
    const recipe = useSelector(getRecipe(recipeId));
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRecipe(recipeId));
    }, [dispatch, recipeId]);

    if (!recipe) {
        return <div>Loading...</div>; // Render a loading state while fetching the recipe
    }
    
    return (
        <div className='recipe-show-container'>
            <div className="recipe-header-container">
                <div id="recipe-name-box">
                    <h1 id="recipe-name-show">{recipe.name}</h1>
                    <p id="recipe-author-show">By <span id="author-underline">{recipe.author}</span></p>
                </div>
                <img id="recipe-show-img"src={recipe.imageUrl}></img>
            </div>
            <div className="details-description-container">
                <div id="time-rating-notes">
                    <p>{recipe.cookingTime}</p>
                    Rating
                    <br/>
                    Notes
                </div >
                <div id="description-box">
                    <p>{recipe.description}</p>
                </div>
            </div>
            <div className="ingredients-preparation-container">
                <div id="ingredients">
                    <p>INGREDIENTS</p>
                    {recipe.ingredients} 
                </div >
                <div id="preparation"> 
                    <p>PREPARATION</p>
                    {recipe.preparation}
                </div>
            </div>
            <div className="ratings-notes-container">
                <div id="ratings-section">
                    <p>RATINGS</p>
                    <div id="stars-container">
                        Stars Section
                    </div>
                    <div id="your-rating-stars">
                        Your rating
                    </div>
                </div>
                <div id="cooking-notes-container">
                    <p>COOKING NOTES</p>
                    <CookingNotesForm recipeId={recipeId}/>
                    <CookingNotesIndex recipeId={recipeId} />
                </div>
            </div>
            <div className="newsletter-section-container">
                <div id="left-side-newsletter">
                    <h3>Get Our Newsletter</h3>
                    <p>Get recipes, tips and CFT special offers delivered straight to your inbox. Opt out or contact us anytime. See our Privacy Policy.</p>
                </div>
            </div>
            <div className="about-us-container">
                <div id="about-us-text">
                    <h3>About Us</h3>
                    <p>
                    CFT Cooking is a subscription service of The Chew Fork Times. It is a digital cookbook and cooking guide alike, available on all platforms, that helps home cooks of every level discover, save and organize the world’s best recipes, while also helping them become better, more competent cooks. Subscribe now for full access.
                    </p>
                </div>
                <div id="links-section">
                    Links Section
                </div>
            </div>
        </div>
    )

}