import './RecipeOfTheDay.css'
import { useEffect, useState } from 'react';

function RecipeOfTheDay() {
    const [recipe, setRecipe] = useState([]);

    useEffect(() => {
        const fetchRecipe = async () => {
        const res = await fetch("/api/recipes");
        setRecipe (await res.json());
        }
        fetchRecipe();
    }, []);
    

    return (
        <div className="recipe-of-the-day-container">
            <img src={recipe.photoUrl} alt="recipe of the day" />
        </div>
    )
}

export default RecipeOfTheDay;