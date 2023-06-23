
import './RecipeShow.css'
import { useDispatch, useSelector } from 'react-redux';
import { fetchRecipe, getRecipe } from '../../store/recipes';
import { useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';

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
        <div className="show-component">
            <h1>{recipe.name}</h1>
            <p>{recipe.description}</p>
            <Link to="/">Back Home</Link>
            <p>HELLO FROM THE RECIPE SHOW PAGE</p>
        </div>
    )

}