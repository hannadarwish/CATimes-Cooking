json.recipe do
    json.extract! @recipe, :name, :author, :cooking_time, :description, :ingredients, :preparation
    if @recipe.photo.attached?
        json.photoUrl @recipe.photo.url
    else
        json.photoUrl ""
    end
end