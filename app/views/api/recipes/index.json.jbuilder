
# json.array! @recipes do |recipe|
#     json.id recipe.id
#     json.name recipe.name
#     json.cooking_time recipe.cooking_time
#     json.description recipe.description
#     json.ingredients recipe.ingredients
#     json.preparation recipe.preparation
#     json.meal_category recipe.meal_category
#     json.image_url recipe.image_url
#     json.author recipe.author
#     json.org_category recipe.org_category
# end

@recipes.each do |recipe|
    userIds = SavedRecipe.where(recipe_id: recipe.id).pluck(:user_id)
    json.set! recipe.id do 
        json.extract! recipe, :id, :name, :cooking_time, :description, :ingredients, :preparation, :meal_category, :org_category, :author, :image_url
        json.saved userIds.include?(current_user.id) ? true : false
    end
end