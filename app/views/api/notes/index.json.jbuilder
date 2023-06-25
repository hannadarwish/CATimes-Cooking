
@notes.each do |note|
    json.set! note.id do 
        json.extract! note, :id, :recipe_id, :body, :author_id, :reviewer_name 
    end
end