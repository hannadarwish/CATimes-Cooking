class Api::SavedRecipesController < ApplicationController

    def index 
        # get saved recipes associated with current user
        @saved_recipes = current_user.saved_recipes 
        render :index 
    end

    def create
        @saved_recipe = SavedRecipe.new(saved_recipe_params)
        @saved_recipe.user = current_user 

        if @saved_recipe.save
            render :show 
        else
            # debugger
            render json: { errors: @saved_recipe.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        # find the saved recipe by the id and check if it belogns to current user
        @saved_recipe = SavedRecipe.find_by(id: params[:id], user: current_user)
        if @saved_recipe
            @saved_recipe.destroy 
        else
            render json: { error: "Saved recipe not found"}, status: :not_found
        end
    end

    private

    def saved_recipe_params
        params.require(:saved_recipe).permit(:recipe_id)
    end

end
