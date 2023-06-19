import React, { useState, useEffect } from "react";
import { useDispatch } from 'react-redux';
import { useHistory } from 'react-router-dom';


function RecipeBoxButton({ user }) {
    const dispatch = useDispatch();
    const history = useHistory();

    const handleRecipeBoxClick = (e) => {
        history.push('/recipebox');
    }

    return (
        <>
            <button id="recipe-box-button" onClick={handleRecipeBoxClick}> 
                Your Recipe Box
            </button>
        </>
    );
}

export default RecipeBoxButton;