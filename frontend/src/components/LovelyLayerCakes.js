// imports from RecipeCarousel and fills in the images with lovely layer cakes

import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import RecipeCarousel from "./RecipeCarousel/RecipeCarousel";
import { fetchRecipes, getRecipes } from "../store/recipes";

export default function LovelyLayerCakes() {
    const recipes = useSelector(getRecipes);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRecipes());
    }, [dispatch]);

    return (
        <section className="lovely-layer-cakes-carousel">
            <RecipeCarousel recipes={recipes} />
        </section>
    );
}