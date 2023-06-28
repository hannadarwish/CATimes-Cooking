
json.recipe do
    userIds = SavedRecipe.where(recipe_id: @saved_recipe.id).pluck(:user_id)
    json.extract! @saved_recipe, :id

    recipe = @saved_recipe.recipe

    json.name recipe.name
    json.cooking_time recipe.cooking_time
    json.description recipe.description
    json.ingredients recipe.ingredients
    json.preparation recipe.preparation
    json.meal_category recipe.meal_category
    json.org_category recipe.org_category
    json.author recipe.author
    json.image_url recipe.image_url

    json.saved userIds.include?(current_user.id) ? true : false
end