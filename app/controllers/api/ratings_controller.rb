class Api::RatingsController < ApplicationController

    def create 
        @rating = Rating.new(rating_params)
        if @rating.save
            render json: rating, status: :created 
        else
            render json: { errors: rating.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy 
        @rating = Rating.find(params[:id])
        @rating.destroy
    end

    private 

    def rating_params
        params.require(:rating).permit(:user_id, :recipe_id, :rating)
    end

end
