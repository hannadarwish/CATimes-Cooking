import './CategorySidebar.css'
import { useDispatch, useSelector } from 'react-redux';
import { getRecipes, fetchRecipes } from '../../store/recipes';
import { useEffect } from 'react';


export default function CategorySidebar() {

    const recipes = useSelector(getRecipes);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRecipes())
    }, [])

    const categories = [
        { name: 'Breakfast', filter: 'Breakfast' },
        { name: 'Brunch', filter: 'Brunch' },
        { name: 'Lunch', filter: 'Lunch' },
        { name: 'Dinner', filter: 'Dinner' },
        { name: 'Sides', filter: 'Sides' },
        { name: 'Dessert', filter: 'Dessert' },
    ];
    
    return (
        <div className="category-sidebar-item-container">
            <ul>
                {categories.map((category) => {
                    const filteredRecipes = recipes.filter((recipe) => recipe.mealCategory === category.filter);
                    const numRecipes = filteredRecipes.length;
                    const imageUrl = filteredRecipes[0]?.imageUrl;

                    if (numRecipes > 0) {
                        return (
                            <li key={category.name}>
                            <div className="category-item">
                                <div id="sidebar-img-category">
                                    <img src={imageUrl} />
                                    <h3>{category.name}</h3>
                                </div>
                                <p>{numRecipes}</p>
                            </div>
                            </li>
                        );
                    } return null;
                })}
            </ul>
        </div>
    );

}