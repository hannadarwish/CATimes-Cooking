# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Recipe.destroy_all
    
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
  
    puts "Creating users..."
    # Create one user with an easy to remember email and password:
    User.create!(
      email: 'demo@user.io', 
      password: 'password'
    )
  
    # More users
    10.times do 
      User.create!({
        email: Faker::Internet.unique.email,
        password: 'password'
      }) 
    end
  
    puts "Done!"

    puts "Creating recipes..."

    Recipe.create!(
      name: 'Spaghetti Carbonara',
      cooking_time: '30 minutes',
      description: 'Classic Italian pasta dish made with eggs, cheese, pancetta, and black pepper.',
      ingredients: 'Spaghetti, eggs, Pecorino Romano cheese, pancetta, black pepper, salt',
      preparation: 'Cook spaghetti until al dente. In a separate bowl, whisk eggs, cheese, and black pepper. In a pan, cook pancetta until crispy. Drain spaghetti and mix with the egg mixture. Add pancetta and toss until coated. Serve with additional cheese and black pepper.',
      difficulty: 'Intermediate',
      category: 'Pasta'
    )

    Recipe.create!(
      name: 'Chicken Parmesan',
      cooking_time: '45 minutes',
      description: 'Breaded chicken cutlets topped with tomato sauce and melted cheese.',
      ingredients: 'Chicken breasts, breadcrumbs, Parmesan cheese, eggs, tomato sauce, mozzarella cheese, olive oil, salt, pepper',
      preparation: 'Pound chicken breasts to an even thickness. Dip chicken in beaten eggs, then coat with breadcrumbs and Parmesan cheese mixture. Heat olive oil in a pan and cook chicken until golden brown. Place chicken on a baking sheet, top with tomato sauce and mozzarella cheese, and bake until cheese is melted and bubbly. Serve with pasta or salad.',
      difficulty: 'Intermediate',
      category: 'Chicken'
    )

    Recipe.create!(
      name: 'Chocolate Chip Cookies',
      cooking_time: '20 minutes',
      description: 'Classic homemade cookies loaded with chocolate chips.',
      ingredients: 'Butter, white sugar, brown sugar, eggs, vanilla extract, all-purpose flour, baking soda, salt, chocolate chips',
      preparation: 'Cream together butter, white sugar, and brown sugar. Beat in eggs and vanilla extract. In a separate bowl, combine flour, baking soda, and salt. Gradually add dry ingredients to the butter mixture. Stir in chocolate chips. Drop spoonfuls of dough onto a baking sheet and bake until golden brown. Allow to cool before serving.',
      difficulty: 'Easy',
      category: 'Dessert'
    )

    puts "Done!"
  end
