class Api::UsersController < ApplicationController
  # You can override what keys you want Rails to automatically nest by making a call to wrap_parameters at the top of any controller definition. 
  wrap_parameters include: User.attribute_names + ['password']

  # The create action, which is used to sign up a new user, will use mass assignment with strong params to set the new user's attributes.

  def create
    @user = User.new(user_params)
    
    if @user.save 
      login!(@user)
      render json: { user: @user }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
