import './RecipeOfTheDay.css';
import { GrBookmark } from 'react-icons/gr';

function RecipeOfTheDay() {

    return (
        <div className="recipe-of-the-day-container">
            <img id="recipe-of-the-day-image" src="https://static01.nyt.com/images/2022/07/15/dining/MC-Classic-Pasta-Salad-15SALADREX/MC-Classic-Pasta-Salad-15SALADREX-threeByTwoMediumAt2X.jpg" />
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
                <button id="save-to-recipe-box-button">
                    <div id="bookmark">{<GrBookmark color="white" />}</div>
                    <span id="save-to-recipe-box-text"> Save to Recipe Box</span>
                </button>
            </div>
        </div>
    )
}

export default RecipeOfTheDay;
