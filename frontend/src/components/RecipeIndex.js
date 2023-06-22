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
import LovelyLayerCakes from "./LovelyLayerCakes";

export default function RecipeIndex() {
    const recipes = useSelector(getRecipes);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRecipes())
    }, [])

    const lovelyLayerCakes = recipes.filter(recipe => recipe.orgCategory === "Lovely Layer Cakes");
    const trendingRecipes = recipes.filter(recipe => recipe.orgCategory === "Trending Recipes");

    return (
        <>
            { recipes.length === 0 ? <h1>loading...</h1> : 
            <div>
                <section className="lovely-layer-cakes-carousel">
                    <RecipeCarousel recipes={lovelyLayerCakes} />
                </section>
                <section className="trending-recipes-carousel">
                    <RecipeCarousel recipes={trendingRecipes} />
                </section>
                <section className="more-from-our-editors">
                    <MoreFromOurEditors />
                </section>
            </div> }
        </>

    )
}
