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

    return (
        <div>
            <LovelyLayerCakes/>
            <section className="trending-recipes-carousel">
                <RecipeCarousel recipes={recipes}/>
            </section>
            <section className="more-from-our-editors">
                <MoreFromOurEditors />
            </section>
        </div>
    )
}
