import './RecipeOfTheDay.css';
import { GoBookmark, GoBookmarkFill } from 'react-icons/go';
import { saveRecipe, deleteSavedRecipe } from '../../store/savedRecipes';
import { useDispatch, useSelector } from 'react-redux';

function RecipeOfTheDay() {

    const dispatch = useDispatch();
    const recipeId = 13;

    const isRecipeSaved = useSelector((state) => state.recipes[13]?.saved);

    const handleBookmarkClick = () => {
        if (isRecipeSaved) {
            dispatch(deleteSavedRecipe(recipeId));
        } else {
            dispatch(saveRecipe(recipeId));
        }
    };

    const toggleBookmarkIcon = (saved) => {
        return saved ? <GoBookmarkFill id="slide-bookmark" /> : <GoBookmark id="slide-bookmark" />;
    };

    return (
        <div className="recipe-of-the-day-container">
            <a href="/recipes/13">
                <img id="recipe-of-the-day-image" src="https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/pasta-salad-large.jpeg" />
            </a>
            <div className="recipe-of-the-day-text-container">
                <div className="rotd-badge">
                    RECIPE
                    <br/>
                    OF THE DAY
                </div>
                <h3 id="rotd-title">Pasta Salad</h3>
                <p id="rotd-text">
                This pasta salad has everything you could want in the bowl. Serve it the same day it’s made for the brightest flavor and best texture. 
                </p>
                <div id="author-container">
                    <div id="author-img-container">
                        <img id="author-img" src="https://static01.nyt.com/images/2014/04/24/dining/clarkCP/clarkCP-thumbLarge-v2.jpg"></img>
                    </div>
                    Melissa Clark
                </div>
            </div>
            <div className="rotd-buttons">
                <button id="save-to-recipe-box-button" onClick={handleBookmarkClick}>
                    <div id="bookmark">
                    {toggleBookmarkIcon(isRecipeSaved)}
                    </div>
                    <span id="save-to-recipe-box-text"> Save to Recipe Box</span>
                </button>
            </div>
        </div>
    )
}

export default RecipeOfTheDay;
