

@recipes.each do |recipe|
    userIds = SavedRecipe.where(recipe_id: recipe.id).pluck(:user_id)
    json.set! recipe.id do 
        json.extract! recipe, :id, :name, :cooking_time, :description, :ingredients, :preparation, :meal_category, :org_category, :author, :image_url
        json.saved userIds.include?(current_user.id) ? true : false
    end
end