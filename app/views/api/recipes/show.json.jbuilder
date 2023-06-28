json.recipe do
    userIds = SavedRecipe.where(recipe_id: @recipe.id).pluck(:user_id)
    json.extract! @recipe, :id, :name, :author, :cooking_time, :description, :ingredients, :preparation, :image_url
    json.saved userIds.include?(current_user.id) ? true : false
end