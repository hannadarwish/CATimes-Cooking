class Api::RecipesController < ApplicationController

    before_action :require_logged_in, only: [:show]

    def index
        @recipes = Recipe.all
        render :index
    end

    def show 
        @recipe = Recipe.find_by(id: params[:id])

        if @recipe 
            render :show 
        else
            render json: { error: "Recipe not found" }, status: :not_found
        end
    end

end
