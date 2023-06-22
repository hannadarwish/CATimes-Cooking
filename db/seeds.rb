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
      name: 'Strawberry and Cream Layer Cake',
      cooking_time: '2 hours',
      description: 'This delicate cake is inspired by fraisier, a French cake made from layers of sponge, strawberries and cream. Fraisier cakes are elaborately constructed and typically combine several components to make the cream filling, but this strawberry cake is lighter, looser and much more casual. To avoid squishing the cake when slicing, use a serrated knife in long, even strokes to cut clean slices.',
      ingredients: '1½ pounds fresh strawberries, hulled, ½ cup/100 grams granulated sugar, 1cup/240 grams heavy cream, chilled, 1cup/240 grams crème fraîche, mascarpone or sour cream, chilled, pinch of kosher salt, 1 Sponge Cake recipe, baked in a 9-inch springform pan and cooled',
      preparation: 'Step 1
      Fill a small saucepan with about 1 inch of water and set over medium heat until the water steams.
      
      Step 2
      Meanwhile, coarsely chop about a quarter of the strawberries and combine in a medium heatproof bowl with the sugar. Cover the bowl tightly and set it over the saucepan. Reduce the heat if necessary to keep the water just below a simmer and allow the berries to sit, swirling the bowl once or twice to dissolve any stubborn sugar clumps, until they’ve released all their juices, are mushy, and swim in a translucent red liquid, 35 to 45 minutes. Remove the bowl from the heat, uncover and strain through a fine-mesh strainer. (You should have ½ to ¾ cup of strawberry syrup.) The mushy berries will have given off their color and flavor, and even though you won’t use them in the cake, they’re still tasty. Reserve the berries for spooning over pancakes or yogurt.
      
      Step 3
      In a separate medium bowl, combine the heavy cream, crème fraîche and salt. Whisk the mixture vigorously by hand, or beat with a hand mixer on medium-high, until thick, light and holding a medium peak. Chill the bowl of whipped cream. Thinly slice the remaining raw strawberries lengthwise.
      
      Step 4
      Invert the sponge cake on a flat serving plate or cake stand. Holding a long serrated knife horizontally and parallel to the work surface, use it to lightly score all around the side of the cake at the midway point. Then, using long, even strokes and still holding the knife parallel to the surface, slice clean through the cake, using the score marks as a guide, to cut it into two even layers. Set the top layer aside.
      
      Step 5
      Use a pastry brush to dab several tablespoons of the strawberry syrup across the bottom layer, lightly soaking the entire surface. Pull the bowl of cream from the refrigerator and dollop about half of it across the soaked layer, then spread in an even layer all the way to the edges. Arrange half of the sliced strawberries on top of the cream, then place the second cake layer on top of the first, cut side up. Lightly soak the top layer of cake with the strawberry syrup, reserving any remaining syrup for serving. Spread the remaining cream on top of the cake, then pile the remaining sliced strawberries over top. (If not serving immediately, cover loosely and refrigerate until ready to serve.)
      
      Step 6
      Slice the cake with a serrated knife and serve. Drizzle the slices with any remaining strawberry syrup. The cake is best served the day it’s made, but will keep, covered and chilled, for up to 3 days.',
      meal_category: 'Dessert',
      org_category: "Lovely Layer Cakes",
      author: "Claire Saffitz",
      image_url: "https://static01.nyt.com/images/2021/05/27/dining/cs-strawberry-and-cream-layer-cake/merlin_188069463_60925639-dedc-4df7-959b-659a86fce390-articleLarge.jpg?w=1280&q=75"
    )

    puts "Done!"
  end
