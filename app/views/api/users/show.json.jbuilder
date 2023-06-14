# This template assumes that an @user instance variable has been defined and structures the data that should be rendered for that @user in a JSON response:

json.user do
    json.extract! @user, :id, :email, :created_at, :updated_at
end
