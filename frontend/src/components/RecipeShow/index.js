
import './RecipeShow.css'
import { useDispatch, useSelector } from 'react-redux';
import { fetchRecipe, getRecipe } from '../../store/recipes';
import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import CookingNotesForm from '../CookingNotesForm';
import CookingNotesIndex from '../CookingNotesIndex';
import LoginForm from '../LoginFormModal/LoginForm';
import { Modal } from '../../context/Modal';
import { AiFillGithub, AiFillLinkedin } from 'react-icons/ai';

export default function RecipeShow() {

    const { recipeId } = useParams();
    const recipe = useSelector(getRecipe(recipeId));
    console.log("HELLO")
    console.log(recipe);
    const dispatch = useDispatch();
    const [showLoginModal, setShowLoginModal] = useState(false);
    const isLoggedIn = useSelector(state => state.session.user);

    useEffect(() => {
        dispatch(fetchRecipe(recipeId));
    }, [dispatch, recipeId, isLoggedIn]);

    useEffect(() => {
        // Check if the user is logged in
        if (isLoggedIn === null) {
            setShowLoginModal(true);
        }
    }, [isLoggedIn]);

    if (!recipe) {
        return <div>{showLoginModal && <Modal onClose={() => setShowLoginModal(false)}><LoginForm /></Modal>}</div>; // Render a loading state while fetching the recipe
    }

    console.log(JSON.parse(recipe.ingredients))
    
    return (
        <>
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
                    <p id="ingredients-text">INGREDIENTS</p>
                    <ul>
                        {JSON.parse(recipe.ingredients).map((ingredient, index) => (
                            <li id="ingredients-list-items" key={index}>{ingredient}</li>
                        ))}
                    </ul> 
                </div >
                <div id="preparation"> 
                    <p id="preparation-text">PREPARATION</p>
                    <ol>
                        {JSON.parse(recipe.preparation).map((step, index) => (
                        <li className="steps-text" key={index}>
                            <span id="step-text">Step {index + 1}:</span>
                            <br/>
                            {step}
                        </li>
                        ))}
                    </ol>
                </div>
            </div>
            <div className="ratings-notes-container">
                <div id="ratings-section">
                    <p id="ratings-text">RATINGS</p>
                    <div id="stars-container">
                        {/* Stars Section */}
                    </div>
                    <div id="your-rating-stars">
                        {/* Your rating */}
                    </div>
                </div>
                <div id="cooking-notes-container">
                    <p id="cooking-notes-text">COOKING NOTES</p>
                        <CookingNotesForm recipeId={recipeId} formType={"Add Note"} />
                        <CookingNotesIndex recipeId={recipeId} />
                </div>
            </div>
            <div className="newsletter-section-container">
                <div id="left-side-newsletter">
                    {/* <h3>Get Our Newsletter</h3>
                    <p>Get recipes, tips and CFT special offers delivered straight to your inbox. Opt out or contact us anytime. See our Privacy Policy.</p> */}
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
    )
    

}