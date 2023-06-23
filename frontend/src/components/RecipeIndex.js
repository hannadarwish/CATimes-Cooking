// the Recipe Index will include all of the content on the home page below the recipe of the day
// it will include:
// Recipe Carousel (Lovely Layer Cakes)
// Trending Recipes Carousel
// More From Our Editors section

import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import RecipeCarousel from "./RecipeCarousel/RecipeCarousel";
import MoreFromOurEditors from "./MoreFromOurEditors";
import { fetchRecipes, getRecipes } from "../store/recipes";
import './RecipeIndex.css'

export default function RecipeIndex() {
    const recipes = useSelector(getRecipes);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRecipes())
    }, [])

    const lovelyLayerCakes = recipes.filter(recipe => recipe.orgCategory === "Lovely Layer Cakes");
    const trendingRecipes = recipes.filter(recipe => recipe.orgCategory === "Trending Recipes");

    return (
        <div className="recipe-index-container">
            { recipes.length === 0 ? <h1>loading...</h1> : 
            <div>
                <section className="lovely-layer-cakes-carousel">
                    <h2 id="lovely-layer-cakes-title">Lovely Layer Cakes</h2>
                    <h3 id="lovely-layer-cakes-tagline">They’re not just for birthdays.</h3>
                    <RecipeCarousel recipes={lovelyLayerCakes} />
                </section>
                <section className="trending-recipes-carousel">
                    <h2 id="trending-recipes-title">Trending Recipes</h2>
                    <h3 id="trending-recipes-tagline">Here’s what’s popular on Cooking right now.</h3>
                    <RecipeCarousel recipes={trendingRecipes} />
                </section>
                <section className="more-from-our-editors">
                    <h2>More From Our Editors</h2>
                    <MoreFromOurEditors />
                </section>
            </div> }
        </div>

    )
}
