// imports from RecipeCarousel component, populates images with trending recipes
// imports from RecipeCarousel and fills in the images with lovely layer cakes

import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import RecipeCarousel from "./RecipeCarousel/RecipeCarousel";
import { fetchRecipes, getRecipes } from "../store/recipes";

export default function TrendingRecipes() {
    const recipes = useSelector(getRecipes);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRecipes());
    }, [dispatch]);

    if (recipes.length === 0) {
        return null
    }

    return (
        <section className="trending-recipes-carousel">
            <RecipeCarousel recipes={recipes} />
        </section>
    );
}