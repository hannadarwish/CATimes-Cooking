
// action constants
export const RECEIVE_RECIPES = "recipes/RECEIVE_RECIPES";
export const RECEIVE_RECIPE = "recipes/RECEIVE_RECIPE";

// action creators
const receiveRecipes = (recipes) => {
    return {
        type: RECEIVE_RECIPES,
        recipes: recipes
    }
}

const receiveRecipe = (recipe) => {
    return {
        type: RECEIVE_RECIPE,
        recipe: recipe
    }
}

//getRecipes and getRecipe selector helper functions
export const getRecipe = (recipeId) => (state) => (
    state.recipes ? state.recipes[recipeId] : null
)

export const getRecipes = (state) => (
    state.recipes ? Object.values(state.recipes) : []
)

// thunk action creators
export const fetchRecipes = () => async (dispatch) => {
    const response = await fetch('/api/recipes');

    if (response.ok) {
        const recipes = await response.json();
        dispatch(receiveRecipes(recipes));
    }
}

export const fetchRecipe = (recipeId) => async (dispatch) => {
    const response = await fetch(`/api/recipes/${recipeId}`);

    if (response.ok) {
        const recipe = await response.json();
        dispatch(receiveRecipe(recipe));
    }
}

// Recipe Reducer

export default function recipesReducer(state = {}, action) {
    let newState;
    switch (action.type) {
        case RECEIVE_RECIPES:
            return action.recipes;
        case RECEIVE_RECIPE:
            newState = {...state};
            const recipeId = action.recipe.id;
            newState[recipeId] = action.recipe;
            return newState;
        default:
            return state;
    }
}


