import csrfFetch from "./csrf";

// action constants
export const ADD_SAVED_RECIPE = "savedRecipes/ADD_SAVED_RECIPE";
export const REMOVE_SAVED_RECIPE = "savedRecipes/REMOVE_SAVED_RECIPE";

// Action creators
export const addSavedRecipe = (payload) => {
    return {
        type: ADD_SAVED_RECIPE,
        payload: payload
    };
};

export const removeSavedRecipe = (recipeId) => {
    return {
        type: REMOVE_SAVED_RECIPE,
        recipeId: recipeId
    };
};

// getSavedRecipes helper function

// export const getSavedRecipes = (state) => {
//     return state.savedRecipes ? Object.keys(state.savedRecipes) : [];
// };

// Thunk action creators
// export const fetchSavedRecipes = () => async (dispatch) => {
//     const response = await fetch('/api/saved_recipes');

//     if (response.ok) {
//         const savedRecipes = await response.json();
//             dispatch(addSavedRecipe(savedRecipes));
//     } else {
//         console.log('Failed to fetch saved recipes');
//     }
// };

export const saveRecipe = (recipeId) => async (dispatch) => {
    const response = await csrfFetch('/api/saved_recipes', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ 
            recipe_id: recipeId 
        })
    });

    if (response.ok) {
        const data = await response.json();
        dispatch(addSavedRecipe(data));
    } else {
        console.log('Failed to save recipe');
    }
};

export const deleteSavedRecipe = (recipeId) => async (dispatch) => {
    const response = await csrfFetch(`/api/saved_recipes/${recipeId}`, {
        method: 'DELETE',
    });

    if (response.ok) {
        dispatch(removeSavedRecipe(recipeId));
    } else {
        console.log('Failed to remove saved recipe');
    }
};

// saved recipes reducer
export default function savedRecipesReducer(state = {}, action) {
    let newState;

    switch (action.type) {
        case ADD_SAVED_RECIPE:
            newState = {...state};
            const recipeId = action.recipe.id;
            newState[recipeId] = action.recipe;
            return newState;
        case REMOVE_SAVED_RECIPE:
            newState = {...state};
            delete newState[action.recipeId];
            return newState;
        default:
            return state;
    }
}