json.recipe do
    json.extract! @recipe, :name, :cooking_time, :description, :ingredients, :preparation, :category
    if @recipe.photo.attached?
        json.photoUrl @recipe.photo.url
    else
        json.photoUrl ""
    end
end