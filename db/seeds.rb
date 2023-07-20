# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

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
      ingredients: "1½ pounds fresh strawberries (hulled) | ½ cup/100 grams granulated sugar | 1 cup/240 grams heavy cream (chilled) | 1 cup/240 grams crème fraîche, mascarpone or sour cream (chilled) | pinch of kosher salt | 1 Sponge Cake recipe baked in a 9-inch springform pan and cooled",
      preparation: "Fill a small saucepan with about 1 inch of water and set over medium heat until the water steams.
      Meanwhile, coarsely chop about a quarter of the strawberries and combine in a medium heatproof bowl with the sugar. Cover the bowl tightly and set it over the saucepan. Reduce the heat if necessary to keep the water just below a simmer and allow the berries to sit, swirling the bowl once or twice to dissolve any stubborn sugar clumps, until they’ve released all their juices, are mushy, and swim in a translucent red liquid, 35 to 45 minutes. Remove the bowl from the heat, uncover and strain through a fine-mesh strainer. (You should have ½ to ¾ cup of strawberry syrup.) The mushy berries will have given off their color and flavor, and even though you won’t use them in the cake, they’re still tasty. Reserve the berries for spooning over pancakes or yogurt.
      In a separate medium bowl, combine the heavy cream, crème fraîche and salt. Whisk the mixture vigorously by hand, or beat with a hand mixer on medium-high, until thick, light and holding a medium peak. Chill the bowl of whipped cream. Thinly slice the remaining raw strawberries lengthwise. | Invert the sponge cake on a flat serving plate or cake stand. Holding a long serrated knife horizontally and parallel to the work surface, use it to lightly score all around the side of the cake at the midway point. Then, using long, even strokes and still holding the knife parallel to the surface, slice clean through the cake, using the score marks as a guide, to cut it into two even layers. Set the top layer aside.
      Use a pastry brush to dab several tablespoons of the strawberry syrup across the bottom layer, lightly soaking the entire surface. Pull the bowl of cream from the refrigerator and dollop about half of it across the soaked layer, then spread in an even layer all the way to the edges. Arrange half of the sliced strawberries on top of the cream, then place the second cake layer on top of the first, cut side up. Lightly soak the top layer of cake with the strawberry syrup, reserving any remaining syrup for serving. Spread the remaining cream on top of the cake, then pile the remaining sliced strawberries over top. If not serving immediately, cover loosely and refrigerate until ready to serve.
      Slice the cake with a serrated knife and serve. Drizzle the slices with any remaining strawberry syrup. The cake is best served the day it’s made, but will keep, covered and chilled, for up to 3 days.",
      meal_category: 'Dessert',
      org_category: "Lovely Layer Cakes",
      author: "Claire Saffitz",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/strawberry-layer-cake.jpeg"
    )

    # Recipe.create!(
    #   name: 'Strawberry and Cream Layer Cake',
    #   cooking_time: '2 hours',
    #   description: 'This delicate cake is inspired by fraisier, a French cake made from layers of sponge, strawberries and cream. Fraisier cakes are elaborately constructed and typically combine several components to make the cream filling, but this strawberry cake is lighter, looser and much more casual. To avoid squishing the cake when slicing, use a serrated knife in long, even strokes to cut clean slices.',
    #   ingredients: ["1½ pounds fresh strawberries, hulled",
    #   "½ cup/100 grams granulated sugar",
    #   "1 cup/240 grams heavy cream, chilled",
    #   "1 cup/240 grams crème fraîche, mascarpone or sour cream, chilled",
    #   "pinch of kosher salt", "1 Sponge Cake recipe, baked in a 9-inch springform pan and cooled"],
    #   preparation: ["Fill a small saucepan with about 1 inch of water and set over medium heat until the water steams.", "Meanwhile, coarsely chop about a quarter of the strawberries and combine in a medium heatproof bowl with the sugar. Cover the bowl tightly and set it over the saucepan. Reduce the heat if necessary to keep the water just below a simmer and allow the berries to sit, swirling the bowl once or twice to dissolve any stubborn sugar clumps, until they’ve released all their juices, are mushy, and swim in a translucent red liquid, 35 to 45 minutes. Remove the bowl from the heat, uncover and strain through a fine-mesh strainer. (You should have ½ to ¾ cup of strawberry syrup.) The mushy berries will have given off their color and flavor, and even though you won’t use them in the cake, they’re still tasty. Reserve the berries for spooning over pancakes or yogurt.",
    #   "In a separate medium bowl, combine the heavy cream, crème fraîche and salt. Whisk the mixture vigorously by hand, or beat with a hand mixer on medium-high, until thick, light and holding a medium peak. Chill the bowl of whipped cream. Thinly slice the remaining raw strawberries lengthwise.", "Invert the sponge cake on a flat serving plate or cake stand. Holding a long serrated knife horizontally and parallel to the work surface, use it to lightly score all around the side of the cake at the midway point. Then, using long, even strokes and still holding the knife parallel to the surface, slice clean through the cake, using the score marks as a guide, to cut it into two even layers. Set the top layer aside.", "Use a pastry brush to dab several tablespoons of the strawberry syrup across the bottom layer, lightly soaking the entire surface. Pull the bowl of cream from the refrigerator and dollop about half of it across the soaked layer, then spread in an even layer all the way to the edges. Arrange half of the sliced strawberries on top of the cream, then place the second cake layer on top of the first, cut side up. Lightly soak the top layer of cake with the strawberry syrup, reserving any remaining syrup for serving. Spread the remaining cream on top of the cake, then pile the remaining sliced strawberries over top. If not serving immediately, cover loosely and refrigerate until ready to serve.",
    # "Slice the cake with a serrated knife and serve. Drizzle the slices with any remaining strawberry syrup. The cake is best served the day it’s made, but will keep, covered and chilled, for up to 3 days."],
    #   meal_category: 'Dessert',
    #   org_category: "Lovely Layer Cakes",
    #   author: "Claire Saffitz",
    #   image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/strawberry-layer-cake.jpeg"
    # )

    Recipe.create!(
      name: 'Toasted Sesame and Citrus Wedding Cake',
      cooking_time: '18 hours',
      description: "Everyone loves receiving a homemade gift, but how about a showstopping, two-tiered, citrus-festooned, sesame-laced wedding cake? With a little planning (and an organized freezer), it’s so much easier than you think. Thin, even layers of vanilla sponge cake, soaked with a vivid citrus syrup, are draped like lasagna sheets into pans, along with swaths of nutty sesame buttercream, charred citrus compote and a granola-adjacent sesame crunch. The cake rests while you do, then is removed from the pans, coated in buttercream, packed up and assembled the day of the wedding. There's no finer — or more delicious — way to allow the effort, care and creativity of its maker to come through. And don’t forget to save and freeze the excess cake scraps for ice cream sandwiches, trifles or snacking.",
      ingredients: "Yield: About 60 servings | FOR THE VANILLA CHIFFON CAKE | 12 large cold eggs | 1 cup/240 grams neutral oil, like grapeseed | 2 tablespoons vanilla extract | 4 cups/800 grams granulated sugar | 3½ cups/480 grams all-purpose flour | 2 tablespoons plus 2 teaspoons baking powder | 2 teaspoons kosher salt (such as Diamond Crystal) or 1 teaspoon fine sea salt | FOR THE SESAME CRUNCH | Nonstick cooking spray | 4 large egg whites | ½ packed cup/120 grams light brown sugar | 1 teaspoon vanilla extract | ½ teaspoon kosher salt (such as Diamond Crystal) or ¼ teaspoon fine sea salt | 1¾ cups/226 grams toasted white sesame seeds | FOR THE CHARRED CITRUS COMPOTE | 2 large navel oranges | 3 lemons or Meyer lemons | 1½ cups/300 grams granulated sugar | ½ teaspoon citric acid, plus more to taste | FOR THE CHARRED CITRUS SOAK | ½ cup/120 grams fresh lemon juice | ⅓ cup/70 grams granulated sugar | FOR THE TOASTED SESAME BUTTERCREAM | 12 large egg whites | 3 cups/600 grams granulated sugar | 1 cup/150 grams confectioners’ sugar | 1 tablespoon vanilla extract | 1 teaspoon kosher salt (such as Diamond Crystal) or ½ teaspoon fine sea salt, plus more if needed | 2 pounds/912 grams unsalted butter, cut into tablespoons, at room temperature | 1 tablespoon toasted sesame oil | 1 cup/240 grams tahini | TO DECORATE | Assortment of fresh citrus, such as small tangerines, lemons and kumquats, washed and scrubbed | Fresh food-safe greenery, such as bay leaves or olive branches",
      preparation: "PREPARE THE CHIFFON CAKE LAYERS - Heat oven to 350 degrees. Line the bottoms of 3 half-sheet pans (13-by-18-by-1-inch) with sheets of parchment.
      Carefully crack eggs into a bowl without breaking the yolks. Pluck out yolks one at a time with clean fingertips, transferring to a large bowl. Transfer the egg whites to the bowl of a stand mixer; set aside. To yolks, add 1 cup/240 grams water, the oil, vanilla and 3 cups/600 grams granulated sugar; whisk until smooth.
      In a very large bowl, whisk flour, baking powder and salt. Pour yolk mixture into dry ingredients and gently stir to combine. (Small lumps are OK.)
      Using the whisk attachment, beat egg whites in the stand mixer on medium-high speed until a soft peak forms, about 2 minutes. With the mixer running, stream in remaining 1 cup/200 grams granulated sugar and continue whisking until a glossy, floppy meringue forms, another 3 to 4 minutes.
      Scrape one-third of the meringue into yolk mixture and gently fold with a spatula until mixture is loosened. Add remaining meringue and fold until batter feels billowy and some white streaks remain. Divide batter evenly among prepared pans. Smooth the surfaces evenly with an offset spatula and transfer to the oven, working in batches if needed.
      Bake until centers of cakes spring back to the touch and edges are lightly golden, about 18 minutes. If oven heat is uneven, switch the positions of the pans halfway through. Let cakes cool completely in pans until ready to use. The cakes, tightly wrapped in their pans, can be refrigerated for up to 1 week, or frozen for up to 1 month.
      PREPARE THE SESAME CRUNCH - If the oven is off, heat to 350 degrees. Line a 13-by-18-inch sheet pan with a sheet of parchment and coat with nonstick spray.
      In a medium bowl, whisk egg whites, light brown sugar, vanilla and salt until glossy, about 3 minutes. Stir in sesame seeds. Pour batter onto prepared pan and smooth to the edges with a small offset spatula.
      Bake for 6 minutes. Remove from oven and use a bench scraper or butter knife to chop. Bake for another 5 to 6 minutes, or until pieces no longer feel sticky.
      Let sesame crunch cool completely in the pan; it will continue to crisp as it rests. If it still seems chewy after cooling, bake for an additional 3 to 4 minutes. Finely chop into tiny clusters. The sesame crunch can be stored in an airtight container at room temperature for up to 2 weeks, or in the freezer for up to 1 month.
      PREPARE THE CITRUS COMPOTE - Wash and scrub the oranges and lemons. Cut each in half crosswise. Heat a large pot or Dutch oven over medium-low and add fruit, cut sides down. They should sizzle upon contact. Let sear, undisturbed, for about 10 minutes, until the cut sides of the fruit are blackened in spots. Use tongs to carefully flip each piece and continue to cook for another 10 minutes, until the peel is softened and charred in spots.
      Transfer citrus to a cutting board to cool. Add 8 cups water to the pot, scrape the bottom and bring water to a simmer.
      Peel the fruit, and reserve citrus segments. (You should have about 2 cups segments.) Roughly chop peels.
      Add chopped peels to the simmering water and simmer, stirring occasionally, until peels are tender, 10 to 15 minutes. Drain peels in a colander, discarding the water.
      Press citrus segments through a strainer into a small bowl to yield ½ cup juice. Set juice aside for the charred citrus soak (see Make the Citrus Soak).
      Transfer spent pulp in the strainer to the pot, and add granulated sugar, cooked peels and 1 cup/240 grams water. Bring to a simmer over medium-low heat and cook, stirring occasionally, until mixture is thickened and saucy, 25 to 30 minutes. If mixture looks tight or dry, add ¼ cup/60 grams water at a time and continue to cook until peels are tender.
      Remove from heat and use an immersion blender or food processor and pulse until the mixture is smoothed out but retains a little texture. Stir in citric acid, if using. The compote should taste sweet and sour. Add more citric acid if desired. Let cool completely. The compote can be stored in an airtight container in the refrigerator for up to 2 weeks, or in the freezer for up to 1 month.
      MAKE THE CITRUS SOAK
      Make the citrus soak: Combine ½ cup reserved charred citrus juice (see Step 5 of Prepare the Citrus Compote) with ½ cup/120 grams water, the fresh lemon juice and granulated sugar in a small saucepan. Gently warm over low heat, stirring occasionally, until sugar melts, about 5 minutes. Cool completely. The soak can be refrigerated in an airtight container for up to 1 week, or frozen for up to 1 month. Thaw before use.
      PREPARE THE BUTTERCREAM - Add egg whites and granulated sugar to a stand mixer bowl or other large heatproof bowl and set over a medium saucepan of steaming water set over low heat. (The water should not touch the bottom of the bowl.) Whisk continuously until mixture registers 155 degrees, about 10 minutes.
      Remove the bowl from the pot and fit into the stand mixer with the whisk attachment. Whisk on medium-high speed until the mixture has cooled slightly, about 4 minutes. Add confectioners’ sugar and mix on low speed to combine. Mix in vanilla and salt.
      Check the temperature of the meringue with a clean fingertip: It should be room temperature. With the mixer on medium speed, add butter, piece by piece, until fully incorporated, then increase speed to medium-high and whisk until smooth and fluffy, another 3 to 5 minutes.
      If the buttercream looks runny, refrigerate for 10 to 15 minutes to cool and then beat again until it is creamy and spreadable. With machine running, add sesame oil and mix to combine, then add tahini and whisk just until incorporated. Taste and add more salt if desired. The buttercream can be refrigerated in an airtight container for up to 2 weeks, or frozen for up to 1 month. If frozen, thaw overnight in the refrigerator, then bring to room temperature before use (this will take at least 2 hours and possibly more).
      ASSEMBLE THE CAKE TIERS - Line an 8-inch round cake form or pan (at least 3 inches deep) with plastic wrap, being sure to leave plenty of overhang. Repeat with a 10-inch round cake form or pan (also at least 3 inches deep). Peel off and discard parchment from cake layers.
      Cut out the 8-inch cake rounds: Using the bottom of the 8-inch pan as a guide, trace and cut out an 8-inch circle with a small serrated knife on the upper left corner of one of the cake sheets. Trace and cut another 8-inch circle on the lower right corner of the sheet. Trace and cut a half-moon shape on the upper right corner of the sheet, and then the lower left corner. Lay those half-moons over a whole circle and cut out strips of cake from the scraps to complete the circle. You will have three 8-inch rounds total (including the two half-moons and their cake strips).
      Build the 8-inch cake tier: Invert one cake round into the bottom of the plastic wrap-lined pan. Brush cake with 3 tablespoons citrus soak. Spoon ¾ cup buttercream on top, and spread it evenly with a small offset spatula. Dollop ½ cup citrus compote on top of buttercream. Scatter about ¾ cup sesame crunch on top.
      Arrange the two half-moons and strips of cake on top to form the second 8-inch cake layer. Apply another 3 tablespoons citrus soak, then ¾ cup buttercream, followed by another ½ cup citrus compote, plus another ¾ cup sesame crunch. Place the remaining 8-inch cake round on top and brush on 3 tablespoons citrus soak. Wrap the cake pan securely with plastic wrap and refrigerate for at least 12 hours.
      Cut out the 10-inch cake rounds: Using the bottom of the 10-inch pan as a guide, trace and cut a 10-inch circle with a small serrated knife on the left side of one of the cake sheets. Trace and cut part of another 10-inch circle on the right side and a smaller crescent moon on one of the edges. Lay the partial pieces over the whole circle and cut cake scraps to fill in the gaps. Repeat with the third sheet of sponge; you will have four 10-inch rounds total.
      Next, build the 10-inch cake tier: Invert one cake round in the bottom of the plastic wrap-lined pan. Brush cake with ¼ cup citrus soak. Spoon 1 cup buttercream on top, and spread it evenly with a small offset spatula. Dollop ⅔ cup citrus compote on top. Scatter about 1¼ cups sesame crunch on top.
      Place a cake layer with a missing edge on next and complete the round with its matching pieces. Apply another ¼ cup citrus soak, then 1 cup buttercream, followed by another ⅔ cup compote, plus another 1¼ cups sesame crunch. Repeat this sequence with a third layer of cake and its matching pieces, then place the remaining whole 10-inch cake round on top, and brush on the remaining ¼ cup citrus soak. Wrap the cake pan securely with plastic wrap and refrigerate for at least 12 hours. Both cake tiers can be refrigerated for up to 3 days or, preferably, frozen for up to 3 weeks.
      Refrigerate the remaining buttercream until ready to apply. If the cakes have been frozen, they do not need to thaw. Completely frozen cakes are more stable and easier to handle and frost.
      FROST THE CAKE TIERS - Let the reserved refrigerated buttercream sit at room temperature for an hour, then whisk with a stand mixer until fluffy and spreadable, about 3 minutes.
      Invert the 8-inch cake onto an 8- to 8½-inch cardboard cake round set on top of a baking sheet. Remove the cake form or pan, then peel off the plastic wrap. Dollop 2 cups buttercream on top and use an offset spatula to spread it all the way to the edges of the cake.
      Dab 1 cup buttercream on the sides of the cake, smoothing each dab to touch the one before, until none of the cake is visible. Once the sides of the cake are roughly covered in buttercream, run the offset spatula along the top surface again to smooth it out. Run the offset again along the sides of the cake, where excess buttercream will have gathered, to pull away any excess frosting; the cardboard cake round should not be visible. Refrigerate the cake uncovered while you frost the second cake.
      Invert the 10-inch cake onto an 11- to 12-inch cardboard cake round, large flat serving platter or decorative cutting board. Remove the cake form or pan, then peel off the plastic wrap. Dollop 2 cups buttercream on top and use an offset spatula to spread it all the way to the edges of the cake.
      Dab 2 cups buttercream on the sides of the cake, smoothing each dab to touch the one before, until none of the cake is visible. Once the sides of the cake are roughly covered in buttercream, run the offset spatula along the top again to smooth it out. Run the offset again along the sides of the cake, where excess buttercream will have gathered, to pull away any excess frosting. Refrigerate uncovered for at least 1 hour before stacking the tiers. The tiers can be refrigerated separately for up to 2 days.
      ASSEMBLE THE WEDDING CAKE - If the wedding is in another location, transport the separate tiers in deep cardboard boxes or crates to the venue. To assemble, simply place the 8-inch tier with its cardboard base on top of the 10-inch cake. Decorate the edges and sides of the cake with the fresh citrus and greenery. The cake can be displayed in a shaded, cool outdoor space or in a cool or air-conditioned indoor space for up to 5 hours. Do not let the assembled cake sit in direct sun for longer than an hour. The cake is not in danger of collapsing or shifting because the tiers are so wide, but the buttercream may melt in a warm setting.
      WHEN READY TO SERVE, CUT THE CAKE - Using a chef’s knife, cut the 8-inch cake into thirds by making two parallel slices, then cut crosswise into 1-inch-thick pieces, wiping the knife clean between each new cut. Cut the 10-inch cake into quarters by making three parallel slices, then cut those pieces crosswise into 1-inch-thick pieces. The 8-inch cake yields about 24 small slices; the 10-inch cake about 36 slices.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Natasha Pickowicz",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/toasted-sesame-citrus-wedding-cake.jpeg"
    )

    Recipe.create!(
      name: "Chocolate-Chocolate Birthday Cake",
      cooking_time: "3 hours",
      description: "This is the birthday cake I’ve made for my son since he was about 11. After boxed cakes, ice-cream cakes, a cake in a Darth Vader mold (that year, the party’s theme was “May the Fours Be With You), this cake hit the spot and remains a favorite. It’s a double-layer devil’s-food cake made with cocoa and bittersweet chocolate, the same pair that makes the frosting so luscious.  You can make the layers ahead of time, wrap them and freeze them for up to a month.  As for the frosting, it’s best spread between the layers and over the cake when it’s just made. Once assembled, the cake can be refrigerated overnight. It cuts most easily when it’s cold but tastes best when it’s at room temperature, which is about what it will be once the candles are blown out and the slices put on plates. Ice cream alongside is unnecessary but nice. Hey, it’s a birthday!",
      ingredients: "Yield: 12 to 14 servings. | FOR THE CAKE | 2 sticks (226 grams) unsalted butter, at room temperature (plus more for the pan) | ⅔ cup (56 grams) unsweetened cocoa powder (plus more for the pan) | 2 cups (272 grams) all-purpose flour | 1½ teaspoons baking powder | ½ teaspoon baking soda | ½ teaspoon fine sea salt | 1¼ cups (250 grams) sugar | 4 large eggs, at room temperature | 2 teaspoons pure vanilla extract | 1 cup (240 ml.) buttermilk, well shaken | 4 ounces (113 grams) bittersweet chocolate, melted and cooled | FOR THE FROSTING | 3⅓ cups (405 grams) confectioners’ sugar | 4½ tablespoons unsweetened cocoa powder | ½ teaspoon fine sea salt | 3 sticks (339 grams) unsalted butter, at room temperature | 6 ounces (170 grams) bittersweet chocolate, melted and cooled | 4½ tablespoons buttermilk | Small decorations to scatter over the cake, optional",
      preparation: "Center a rack in the oven, and preheat it to 350. Butter the interiors of two 9-inch round cake pans, dust with a little cocoa powder and tap out the excess. Sift together the flour, cocoa, baking powder, baking soda and salt.
      Working with an electric mixer (use the paddle, if you have one), beat the butter and sugar together on medium speed for 3 minutes, until light and fluffy. Add the eggs one by one, and beat for a minute after each goes in; beat in the vanilla. Reduce the speed to low, and add the dry ingredients in 3 additions and the buttermilk in 2 (start and finish with the dry, and don’t worry if the buttermilk makes the batter look slightly curdled). Mix in the melted chocolate. Divide the batter evenly between the pans.
      Bake for 24 to 28 minutes, until a tester poked into the center of the cakes comes out clean. Transfer to racks, let rest 5 minutes and then run a blunt knife around the edges of the pans. Unmold the cakes onto the racks, and cool to room temperature.
      Make the frosting: Sift together the confectioners’ sugar and cocoa powder. Using an electric mixer (with the paddle, if available), beat the sugar, cocoa, salt and butter on high speed until fluffy. On low speed, add the chocolate. When it’s almost incorporated, beat in the buttermilk. It’s best to use the frosting immediately.
      If necessary, just before you’re ready to frost the cakes, slice a sliver off the top of each layer to create a flat surface. To assemble, place one cake layer, top up, on a serving platter, and cover with frosting. Top with the second layer, top down, jiggling it into the frosting to hold it in place. Frost the top and sides of the cake — go sleek or swirly. If you’re using decorations, scatter them over the cake. Chill for at least 1 hour (or for up to 1 day); bring to room temperature before serving.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Dorie Greenspan",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/chocolate-cake.jpeg"
    )

    Recipe.create!(
      name: "Red Velvet Cake",
      cooking_time: "1 hour",
      description: "This is similar to the original recipe that began the red velvet craze. It was developed by the Adams Extract company in Gonzales, Tex. The original recipe, popularized in the 1940s, called for butter flavoring and shortening and is usually iced with boiled milk, or ermine, frosting.",
      ingredients: "One 9-inch cake | ½ cup/115 grams butter, at room temperature, plus 2 tablespoons to prepare pans | 3 tablespoons/20 grams cocoa powder, divided | 1½ cups/300 grams granulated sugar | 2 eggs | 2 teaspoons/10 milliliters vanilla extract | 2 tablespoons/30 milliliters red food coloring | 1 teaspoon/6 grams salt | 1 teaspoon/5 grams baking soda | 2½ cups/320 grams flour, sifted | 1 cup/240 milliliters whole buttermilk | 1 tablespoon/15 milliliters vinegar | Ermine icing (see recipe), or other fluffy white icing", 
      preparation: "Heat oven to 350 degrees. Prepare three 9-inch cake pans by buttering lightly and sprinkling with 1 tablespoon sifted cocoa powder, tapping pans to coat and discarding extra cocoa. (This recipe can also be made in 2 9-inch cake pans.)
      Cream butter and sugar together. Add eggs one at a time and beat vigorously until each is incorporated. Mix in vanilla.
      In a separate bowl, make a paste of the remaining 2 tablespoons cocoa and the food coloring. Blend into butter mixture.
      Sift together remaining dry ingredients. Alternating in 2 batches each, add dry ingredients and buttermilk to the butter mixture. In the last batch of buttermilk, mix in the vinegar before adding to the batter. Mix until blended.
      Divide batter among 3 pans and bake for about 20 to 25 minutes. Cool on a rack completely.
      To assemble, remove 1 cake from its pan and place flat side down on a serving platter. Drop about 1 cup of icing onto cake and, using a flat spatula, spread evenly over top. Remove the second cake from its pan. Place flat side down on top of first layer. Use remaining frosting to cover top and sides of cake.", 
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Kim Severson",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/red-velvet-cake.jpeg"
    )

    Recipe.create!(
      name: "Pumpkin Layer Cake With Caramel Buttercream",
      cooking_time: "2 hours",
      description: "Warmly spiced pumpkin cake and toasty caramel are a natural pair in this fall showstopper. The cake is light and fluffy with just enough spice to highlight the pumpkin flavor, while a generous pour of caramel sauce between the layers adds richness. (Store-bought caramel sauce will also work, but expect a slightly sweeter result.) For an impressive presentation, top the frosted cake with a bit more caramel sauce, and let it trail down the sides. It’s just the thing for a fall birthday treat or the Thanksgiving table.",
      ingredients: "Yield: 10 to 12 servings | FOR THE CAKE | 2½ cups plus 2 tablespoons/330 grams cake flour | 1½ teaspoons baking powder | 1½ teaspoons baking soda | 1¾ cups/350 grams granulated sugar | 1 cup/225 grams unsalted butter, softened | 1 tablespoon cinnamon | 1½ teaspoons ground cardamom | ¼ teaspoon freshly grated nutmeg | ¼ teaspoon ground allspice | 1 teaspoon kosher salt | 3 large eggs, at room temperature | 2 teaspoons vanilla extract | 2½ cups/610 grams pumpkin purée, at room temperature | FOR THE CARAMEL SAUCE | 1 cup/200 grams granulated sugar | 2 tablespoons unsalted butter, softened | ¾ cup/180 milliliters heavy cream, at room temperature | 1 tablespoon whiskey or 2 teaspoons vanilla extract | ½ teaspoon kosher salt | FOR THE BUTTERCREAM | 4 large egg whites | 1 cup/200 grams granulated sugar | 2 cups/450 grams unsalted butter, softened and cut into tablespoons | Pinch of kosher salt",
      preparation: "Heat oven to 350 degrees. Butter three 8-inch cake pans and line the bottoms with parchment paper. Flour the pans and paper.
      Sift the flour, baking powder and baking soda into a large bowl.
      In the bowl of a stand mixer fitted with the paddle attachment, combine the sugar, butter, spices and salt. Beat on medium-high until very light and fluffy, about 5 minutes. Stop the mixer occasionally to scrape the bottom and sides of the bowl. Add the eggs one at a time, mixing for about 20 seconds between each egg. Add the vanilla extract and pumpkin purée and mix until well combined, scraping the bottom and sides of the bowl as necessary. The mixture will look curdled.
      Set mixer to low, and add the dry ingredients all at once, stirring until a few spots of flour remain. Remove the bowl from the mixer, and use a rubber spatula to finish folding the dry ingredients into the batter. Scrape the bottom and sides of the bowl to ensure the batter is evenly mixed.
      Divide the batter among the prepared pans (about 3 cups per pan), smooth the tops, and tap the pans on a countertop to release any large air bubbles. Bake the cakes until golden and puffed, and a tester inserted into the center comes out clean, 20 to 25 minutes.
      Cool the cakes in the pans on a rack for 10 minutes, then use the tip of a knife to loosen the edges and carefully invert them onto the rack to cool completely.
      Meanwhile, make the caramel sauce: In a large saucepan over medium-high heat, combine the sugar and 3 tablespoons water. Swirl the pan occasionally until the sugar dissolves, but do not stir. Continue to cook, swirling the pan occasionally to help the mixture brown evenly, until it is deep amber in color. At this point, don't walk away from the pot: The caramel will go from amber to burned in mere moments.
      Remove the pan from the heat, and carefully whisk in butter and heavy cream. The mixture will expand and sputter before turning into a smooth sauce. Add the whiskey and salt. Carefully pour the caramel into a heat-safe container and cool to room temperature. You will have about 1½ cups.
      Make the buttercream: In the bowl of a stand mixer, combine the egg whites and sugar. Set the bowl over a pot of simmering water, and whisk continuously until the sugar has dissolved and the mixture is hot to the touch, 5 to 7 minutes.
      Use the whisk attachment of the stand mixer to beat the egg white mixture until stiff, glossy peaks form and the mixture and bowl are cool to the touch, about 10 minutes.
      Switch to the paddle attachment and reduce speed to medium. With the mixer running, add the butter a couple of tablespoons at a time and beat the buttercream until smooth and fluffy. During this step, the buttercream will likely break and look curdled; turn up the speed on the mixer for a few seconds, and it will come back together. Continue until all of the butter is incorporated then add the salt. Slowly add ½ cup cooled caramel sauce, and stir until well combined. If the buttercream is extremely soft or runny, put the bowl in the refrigerator for about 10 minutes, then whip until smooth.
      Assemble the cake: If necessary, use a serrated knife to trim the cooled cake layers so they are flat and even. Add a small spoonful of buttercream onto a cardboard cake round or serving plate, and place the first layer of cake, cut side up, on top.
      Spread about ¾ cup buttercream on top of the cake. Drizzle the buttercream with 1 tablespoon of caramel sauce. Be careful not to drizzle the caramel all of the way to the edge so it doesn’t spill out the sides.
      Place the second cake layer on top and repeat with buttercream and caramel. Place the final layer on top, cut side down, and spread the top and sides of the cake with a thin, even layer of buttercream. Refrigerate the cake until the buttercream is firm, about 30 minutes.
      Spread the remaining buttercream in an even layer over the cake. If you’d like to add a caramel drizzle, refrigerate the fully frosted cake until firm then carefully spread about ⅓ cup of room temperature caramel sauce over the top of the cake. Use an offset spatula to gently ease it towards the edges so it drips down the sides. Serve at room temperature. Store leftover cake in the refrigerator, but bring to room temperature before serving. Leftover caramel sauce can be stored in an airtight container in the refrigerator",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Yossy Arefi",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/pumpkin-layer-cake.jpeg"
    )

    Recipe.create!(
      name: "Hummingbird Cake",
      cooking_time: "1 hour",
      description: "This super-simple tropical cake contains a hefty amount of mashed bananas and crushed pineapple. Often associated with the American South, where it is believed to have adopted a cream cheese frosting, it most likely originated in Jamaica, where it was called a Doctor Bird Cake. (“Doctor bird” is the nickname of Jamaica’s national bird, the red-billed streamertail hummingbird.) Some say this cake is sweet enough to attract even hummingbirds, while others say the name derives from how bananas, a key ingredient in the cake, resemble the bird’s beak. The end result tastes similar to banana bread, but with the moistness and flavor of a spice-filled carrot cake.",
      ingredients: "Yield: 12 servings | FOR THE CAKE | Nonstick baking spray | 3¾ cups/480 grams all-purpose flour | 2 teaspoons ground cinnamon | 1 teaspoon baking soda | 1 teaspoon kosher salt | 3 large eggs, at room temperature | 1½ cups/340 grams overripe mashed bananas (about 3 bananas) | 1 packed cup/220 grams dark brown sugar | 1 cup/200 grams granulated sugar | 1 cup/240 milliliters vegetable oil | 2 teaspoons vanilla extract | 2 (8-ounce/227-gram) cans crushed pineapple in juice (about 1¾ cups) | ¾ cup/85 grams chopped toasted pecan halves | FOR THE FROSTING | 2 (8-ounce/226-gram) packages cream cheese, at room temperature | 1 cup/225 grams unsalted butter (2 sticks), at room temperature | 7⅓ cups/905 grams confectioners’ sugar | 4 teaspoons vanilla extract | Heaping ¾ cup/85 grams toasted pecan halves, for garnish | Dried pineapple rings and edible flowers, for garnish", 
      preparation: "Prepare the cake: Heat oven to 350 degrees. Grease three (9-inch) cake pans with nonstick baking spray. In a large bowl, whisk together the flour, cinnamon, baking soda and salt. In a second large bowl, whisk together the eggs, mashed bananas, sugars, oil and vanilla.
      Make a well in the dry ingredients and add the wet ingredients to the center of the well. Gently fold using a rubber spatula to combine. Add the pineapple and pecans, and fold again until just incorporated.
      Divide the batter evenly among the cake pans. Bake until golden, cooked through and an inserted toothpick comes out clean, 25 to 30 minutes. Move the cakes to a wire baking rack to cool in the pans for 10 minutes. Then, remove from the pans and allow to cool completely on the wire racks
      As cakes cool, make the cream cheese frosting: In a stand mixer fitted with the paddle attachment, add the cream cheese, butter, confectioners’ sugar and vanilla. Mix on low speed until all the ingredients just come together. Then, increase the speed to medium and mix until creamy and smooth, about 5 minutes.
      Assemble the cake: Place the first layer of the cake top-side down onto a cake stand or plate. Spread the top with cream cheese frosting. Repeat with the second two layers, always placing the top side down to create a very flat surface. Frost the top and sides of the cake.
      Place whole toasted pecan halves around the rim of the cake. Garnish with the dried pineapple and edible flowers, as desired. Slice and serve.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Vallery Lomas",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/hummingbird-cake.jpeg"
    )

    Recipe.create!(
      name: "Oven-Roasted Chicken Shawarma",
      cooking_time: "45 minutes",
      description: "Here is a recipe for an oven-roasted version of the classic street-side flavor bomb usually cooked on a rotisserie. It is perfect for an evening with family and friends. Serve with pita and tahini, chopped cucumbers and tomatoes, some olives, chopped parsley, some feta, fried eggplant, hummus swirled with harissa, rice or rice pilaf. You can make the white sauce that traditionally accompanies it by cutting plain yogurt with mayonnaise and lemon juice, and flecking it with garlic. For a red to offset it, simmer ketchup with red pepper flakes and a hit of red-wine vinegar until it goes syrupy and thick, or just use your favorite hot sauce instead.",
      ingredients: "Yield: 4 to 6 servings | 2 lemons, juiced | ½ cup plus 1 tablespoon olive oil | 6 cloves garlic, peeled, smashed and minced | 1 teaspoon kosher salt | 2 teaspoons freshly ground black pepper | 2 teaspoons ground cumin | 2 teaspoons paprika | ½ teaspoon turmeric | A pinch ground cinnamon | Red pepper flakes, to taste | 2 pounds boneless, skinless chicken thighs | 1 large red onion, peeled and quartered | 2 tablespoons chopped fresh parsley",
      preparation: "Prepare a marinade for the chicken. Combine the lemon juice, ½ cup olive oil, garlic, salt, pepper, cumin, paprika, turmeric, cinnamon and red pepper flakes in a large bowl, then whisk to combine. Add the chicken and toss well to coat. Cover and store in refrigerator for at least 1 hour and up to 12 hours.
      When ready to cook, heat oven to 425 degrees. Use the remaining tablespoon of olive oil to grease a rimmed sheet pan. Add the quartered onion to the chicken and marinade, and toss once to combine. Remove the chicken and onion from the marinade, and place on the pan, spreading everything evenly across it.
      Put the chicken in the oven and roast until it is browned, crisp at the edges and cooked through, about 30 to 40 minutes. Remove from the oven, allow to rest 2 minutes, then slice into bits. (To make the chicken even more crisp, set a large pan over high heat, add a tablespoon of olive oil to the pan, then the sliced chicken, and sauté until everything curls tight in the heat.) Scatter the parsley over the top and serve with tomatoes, cucumbers, pita, white sauce, hot sauce, olives, fried eggplant, feta, rice — really anything you desire.", 
      meal_category: "Lunch",
      org_category: "Trending Recipes",
      author: "Sam Sifton",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/chicken-shawarma.jpeg"
    )

    Recipe.create!(
      name: "Silken Tofu With Spicy Soy Dressing",
      cooking_time: "5 minutes",
      description: "This recipe is inspired by the many cold silken tofu dishes from East Asia, like Japanese hiyayakko and Chinese liangban tofu. This no-cook dish is a handy one to have up your sleeve, especially for warm evenings when the desire to cook is nonexistent. Silky soft tofu is draped in a punchy soy dressing, creating a lively dish with little effort. The tofu is ideally served cold, but 10 minutes at room temperature can take the edge off. Make it your own with other fresh herbs such as Thai basil, mint or shiso leaves, or add crunch with fried shallots or roasted peanuts. A salty, fermented element like kimchi, pickled radish or ja choi, also known as zha cai, a Sichuan pickled mustard root, would work well, too. One block of silken tofu is usually enough to feed two people, but for a more substantial meal, serve it with hot rice or noodles to create a pleasing contrast of temperatures.",
      ingredients: "Yield: 4 servings | FOR THE SPICY SOY DRESSING | ¼ cup soy sauce | 1 tablespoon rice vinegar | 1 tablespoon sesame oil | 1 tablespoon chile oil | 2 teaspoons granulated sugar | 1 tablespoon toasted white sesame seeds | 1 scallion, green and white parts, finely sliced | FOR THE TOFU | 2 (14-ounce) blocks silken tofu, cold | 1 scallion, green and white parts, thinly sliced | Handful of cilantro leaves", 
      preparation: "Make the dressing: Combine the soy sauce, rice vinegar, sesame oil, chile oil, sugar, sesame seeds and scallion in a small bowl. Whisk until the sugar has dissolved.
      Carefully drain the liquid from the package of tofu, and gently tip the block onto a kitchen towel. (Try to keep the block in one piece, if possible, but don’t worry if it falls apart; it will still taste great.) Pat with another clean kitchen towel, removing as much liquid as possible. Transfer the blocks to one large plate or two smaller plates, and spoon the soy dressing over the top until the tofu is completely covered. Top with scallions and cilantro leaves, and eat on its own or with rice or noodles on the side.", 
      meal_category: "Sides",
      org_category: "Trending Recipes",
      author: "Hetty McKinnon",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/silken-tofu.jpeg"
    )

    Recipe.create!(
      name: "Niku Udon (Japanese Beef Noodle Soup)",
      cooking_time: "30 minutes",
      description: "Whether served on top of a bowl of rice or with chewy udon noodles, thinly shaved beef cooked with onions in a sweet-savory dashi broth is classic, warming Japanese comfort food that can be made in minutes once your pantry is stocked with a few simple Japanese staples.",
      ingredients: "Yield: 4 servings | FOR THE DASHI | 20 grams/about 2 (4-inch) squares kombu | 20 grams/about 2 cups loosely packed katsuobushi (dried bonito flakes) | FOR THE BEEF | 1 pound thinly shaved beef | 1 small yellow onion, thinly sliced | 1 bunch scallions, white parts cut into 2-inch segments and halved lengthwise, light green parts thinly sliced at a sharp angle | 1 tablespoon granulated sugar | ¼ cup sake | 2 tablespoons soy sauce | 2 tablespoons mirin | FOR SERVING | 2 tablespoons soy sauce, plus more as needed | 3 tablespoons mirin, plus more as needed | 1 pound fresh or frozen udon noodles | Shichimi or nanami togarashi, or use your favorite chile powder (optional)", 
      preparation: "Make the dashi: Combine 2 quarts cold water and the kombu in a medium saucepan, and place over medium heat. As soon as the water boils, remove from heat and add the katsuobushi, pushing it gently into the water to submerge (don’t stir vigorously). Steep for 5 to 10 minutes. Strain and discard the kombu and katsuobushi (or reserve to make another batch of weaker dashi) and return the dashi to the saucepan. Keep warm, but don’t let it boil.
      Cook the beef: Combine the shaved beef, onion, scallion whites, sugar, sake, soy sauce, mirin and 1 cup of the finished dashi in a large skillet or sauté pan. Bring to a simmer over high heat, stirring. Continue cooking over high heat, stirring frequently, until the beef and onions are tender and the mixture is still moist but not soupy, 10 to 15 minutes.
      As beef cooks, bring a pot of unsalted water to a boil — udon noodles are typically made with plenty of salt in the dough — and cook the udon noodles according to package directions.
      To serve, add the soy sauce and mirin to the reserved dashi and stir. Taste and adjust seasoning to taste with more soy sauce or mirin. (The broth should have a balanced savory-sweet flavor.)
      Divide the cooked noodles across 4 large serving bowls. Ladle the broth on top of the noodles. Divide the beef and onion mixture evenly across the noodles, including any liquid in the pan. Top each bowl with sliced scallion greens. (You may have extra.) Serve immediately with shichimi togarashi to taste.
      TIPS - You can use instant dashi powder, such as Hondashi, in place of homemade dashi. Katsuobushi, kombu and shichimi togarashi can be found at any Japanese supermarket or many well-stocked Western supermarkets, or ordered online. You can find thinly shaved beef intended for shabu-shabu, sukiyaki or other hot pots at most Asian supermarkets. Alternatively, if you have a source for high-quality shaved beef for cheesesteaks, you can use that. If you can’t find shaved beef, you can use regular ground beef (any fat percentage will do) to achieve different but delicious results.
      If you prefer, you can turn this recipe into gyudon (Japanese beef and rice bowls): Omit the noodles and broth (making only enough dashi to cook the beef) and serve the cooked beef mixture on top of bowls of steamed white rice. Garnish with beni shoga (pickled red ginger) and a poached or fried egg.", 
      meal_category: "Dinner",
      org_category: "Trending Recipes",
      author: "J. Kenji López-Alt",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/niku-udon.jpeg"
    )

    Recipe.create!(
      name: "Spicy Korean Rice Cakes (Tteokbokki)",
      cooking_time: "20 minutes",
      description: "This popular street-food dish, called tteokbokki, is a garlicky, richly spiced dish of rice cakes bathed in red chile paste. Tteokbokki (pronounced duck-bo-key) got its own festival, spinning off from the larger annual Seoul festival of rice cakes, or tteok.",
      ingredients: "Yield: 2 servings | 8 ounces fresh or thawed frozen tteok (see note) | 4 ounces beefsteak, such as chuck or sirloin, very thinly sliced | ½ teaspoon soy sauce | 2 teaspoons sesame oil | 2 cloves garlic, minced | 1 small onion, thinly sliced | 2 cups green cabbage, cut crosswise into large pieces (optional) | 1 to 2 tablespoons gochujang (Korean chile paste) | 1 to 2 teaspoons sugar | 2 scallions, cut into 1-inch batons | Sesame seeds", 
      preparation: "Soak tteok in cold water to cover while preparing the other ingredients, about 10 minutes. Drain on paper towels.
      Combine beef with soy sauce, 1 teaspoon sesame oil and garlic.
      Heat a wok or skillet over high heat until very hot. Add beef mixture and stir-fry just until lightly browned, 1 minute. Add onion, scallions, and cabbage, if using, and stir-fry until crisp-tender, 2 to 3 minutes.
      Add gochujang and mix. Add about ⅓ cup water, remaining teaspoon sesame oil, sugar and tteok. Mix and let simmer until sauce is thick and tteok is soft, adding water a little at a time as needed. Adjust seasonings with sugar and gochujang.
      Mix in scallions and serve hot, sprinkled with sesame seeds.
      TIP - Tteok (Korean rice cakes, also spelled dduk or toppoki) are available in Asian markets. For this dish, the traditional shape is long cylinders; cut them crosswise in half before cooking. If using dried tteok, cook according to package directions and do not soak.", 
      meal_category: "Sides",
      org_category: "Trending Recipes",
      author: "Julia Moskin",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/spicy-korean-rice-cakes.jpeg"
    )

    Recipe.create!(
      name: "Tabbouleh",
      cooking_time: "30 minutes",
      description: "We think of tabbouleh as a bulgur salad with lots of parsley and mint. But real Lebanese tabbouleh is a lemony herb salad with a little bit of fine bulgur, an edible garden that you can scoop up with romaine lettuce heart leaves or simply eat with a fork. This will keep for a day in the refrigerator, though the bright green color will fade because of the lemon juice.",
      ingredients: "Yield: 6 appetizer spread servings, 4 salad servings | ¼ cup fine bulgur wheat | 1 small garlic clove, minced (optional) | Juice of 2 large lemons, to taste | 3 cups chopped fresh flat-leaf parsley (from 3 large bunches) | ¼ cup chopped fresh mint | ½ pound ripe tomatoes, very finely chopped | 1 bunch scallions, finely chopped | Salt, preferably kosher salt, to taste | ¼ cup extra virgin olive oil | 1 romaine lettuce heart, leaves separated, washed and dried", 
      preparation: "Place the bulgur in a bowl, and cover with water by ½ inch. Soak for 20 minutes, until slightly softened. Drain through a cheesecloth-lined strainer, and press the bulgur against the strainer to squeeze out excess water. Transfer to a large bowl, and toss with the garlic, lemon juice, parsley, mint, tomatoes, scallions and salt. Leave at room temperature or in the refrigerator for two to three hours, so that the bulgur can continue to absorb liquid and swell.
      Add the olive oil, toss together, taste and adjust seasonings. Serve with lettuce leaves.", 
      meal_category: "Sides",
      org_category: "Trending Recipes",
      author: "Martha Rose Shulman",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/tabbouleh.jpeg"
    )

    Recipe.create!(
      name: "Cheesy Breakfast Egg and Polenta Casserole",
      cooking_time: "30 minutes",
      description: "If you’ve had the pleasure of a cheesy polenta dinner, topped with a creamy-yolked egg, you can imagine how good that combination is at breakfast. This quick casserole for a crowd is exactly that, made elegant and easy so you can have a perfectly cooked portion for each person with very little work. Layer your polenta with anything you desire, whether salami or ham — or keep it vegetable-centric with spinach or oven-roasted tomatoes. Make nests between your toppings and the polenta where the eggs will cook slowly, giving you a soft-cooked finish that’s loaded with flavor.",
      ingredients: "Yield: 8 servings | 2 tablespoons unsalted butter, plus more for greasing the pan | 1 cup quick-cooking polenta | ½ teaspoon fine sea salt | 1 cup whole milk | ½ cup/2 ounces fontina or mozzarella, or a blend, shredded | 5 ounces thinly sliced cured meat, such as hot or sweet Italian sausage, salami or ham (optional) | 1 packed cup spinach, kale or other leafy green, torn or chopped (optional) | 8 large eggs | ½ cup/2 ounces grated Parmesan | Ground black pepper | ¼ cup packed basil leaves, larger ones roughly torn (optional)",
      preparation: "Heat oven to 400 degrees with the rack in the center. Generously butter a 9-by-13-inch pan and set aside.
      Bring 4 cups water to a boil. Gradually whisk in the polenta and salt, and cook, stirring constantly until the polenta bubbles and pulls away from the pan, about 3 minutes. Vigorously stir in the milk, butter and cheese until smooth and creamy. (It will seem loose.)
      Spread the polenta onto the bottom of the prepared pan. Layer with meat, greens or anything else you desire. Use the back of a large spoon to create 8 small wells in the polenta. Crack the eggs inside, sprinkle with Parmesan, and bake 10 to 15 minutes, depending on how set you like your eggs. Let stand for 5 minutes; sprinkle with black pepper and basil and serve warm.", 
      meal_category: "Breakfast",
      org_category: "Trending Recipes",
      author: "Sarah Copeland",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/polenta-casserole.jpeg"
    )

    Recipe.create!(
      name: "Pasta Salad",
      cooking_time: "30 minutes",
      description: "This pasta salad has everything you could want in the bowl: loads of ripe tomatoes, chunks of mozzarella, sliced olives, salami and plenty of fresh green herbs, all tossed in a garlicky, oregano-spiked red wine vinaigrette. Serve it the same day it’s made for the brightest flavor and best texture.",
      ingredients: "Yield: 8 to 10 | FOR THE DRESSING | 3 tablespoons red wine vinegar, plus more to taste | 1 garlic clove, finely grated or minced | 1 teaspoon dried oregano | Salt and freshly ground black pepper | ⅓ cup extra-virgin olive oil, plus more for drizzling | FOR THE PASTA | 1 pound short-cut pasta, such as farfalle | 1 pint cherry or grape tomatoes, halved | 8 ounces mozzarella, cubed (or use small mozzarella balls) | 4 ounces sliced salami, cut into ¼-inch ribbons | ¾ cup sliced Kalamata olives | ½ cup thinly sliced cucumber | 3 tablespoons diced red onion | 1 cup coarsely chopped fresh parsley and basil leaves",
      preparation: "Make the dressing: Combine vinegar, garlic, oregano and a big pinch each salt and pepper in a large bowl. Whisk in oil; taste and add more salt, pepper or vinegar as needed. Set aside.
      Prepare the pasta: Bring a large pot of heavily salted water to a boil. Cook the pasta according to the package directions until the pasta is al dente. Drain well, transfer to the large bowl, and toss with the dressing while still warm.
      Add tomatoes, mozzarella, salami, olives, cucumber and onion to the bowl and toss well; fold in herbs. Taste and season with more salt, pepper and vinegar, if you like.
      Drizzle with olive oil and top with cracked black pepper just before serving.",
      meal_category: "Sides",
      org_category: "Recipe of the Day",
      author: "Melissa Clark",
      image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/pasta-salad.jpeg"
    )

#       Recipe.create!(
#       name: "Pasta Amatriciana",
#       cooking_time: "25 minutes",
#       description: "Pasta amatriciana is a traditional Italian dish that features a sauce of guanciale (salt-cured pork jowl), tomato, pecorino romano and chiles. Some variations include onion and white wine. The final product tastes much more complex than the ingredient list would suggest: This simple pantry meal delivers deep flavors, as the bright, tangy tomato base balances the rich pork, and a mix of dried peppers adds layers of subtle heat. Guanciale can be found in Italian specialty shops or online, but pancetta is a good alternative. Bucatini is a thicker pasta with a hollow center that captures the thick sauce, but spaghetti delivers equally tasty results.",
#       ingredients: ["Yield: 4 servings", "2 tablespoons extra-virgin olive oil", "4 ounces guanciale or pancetta, chopped into ¼-inch cubes (¾ cup)",
#     "1 (28-ounce) can whole tomatoes, crushed with your hands in a bowl", "⅛ teaspoon black pepper, plus more to taste",
#   "⅛ teaspoon red-pepper flakes", "Kosher salt (such as Diamond Crystal)", "1 pound dried bucatini",
# "¾ cup grated Pecorino Romano, plus more for garnish"],
#       preparation: ["In a large (12-inch) skillet, heat olive oil over medium. Add guanciale and cook, stirring occasionally, until golden, about 5 minutes. To the skillet, add tomatoes, black pepper and red-pepper flakes, and season with salt. Cook, stirring occasionally and smashing tomatoes with the back of a wooden spoon, until tomatoes have broken down and sauce is thickened, about 15 minutes.",
#     "Meanwhile, in a large pot of salted water, cook pasta according to package directions until just shy of al dente. Reserve 1 cup of the pasta cooking water and drain.", 
#     "Add pasta, tomato sauce and ½ cup of pasta cooking water back to the large pasta pot and stir vigorously over medium-high heat until pasta is evenly coated in the sauce, about 1 minute. (Add more pasta water if sauce is dry.) Remove from heat, stir in the cheese and season to taste with salt.",
#   "Divide pasta among bowls and garnish with more cheese and black pepper."],
#       meal_category: "Dinner",
#       org_category: "Quick Pastas",
#       author: "Kay Chun",
#       image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/amitriciana.jpeg"
#     )

#     Recipe.create!(
#       name: "Kale Sauce Pasta",
#       cooking_time: "20 minutes",
#       description: "This recipe for a vivid, vegetarian pasta sauce, made from blanched kale leaves and loaded with good olive oil and grated cheese, comes from Joshua McFadden, the chef at Ava Gene’s in Portland, Ore., and was inspired by Rose Gray and Ruth Rogers of The River Café in London. The technique is absurdly simple and quick from start to finish, but the result is luxurious and near-creamy. Feel free to play with the pasta shape, but no matter what you choose, be sure to let the blender run for a while at a powerful setting: You want the kale to completely break down into a smooth, bright, airy green puree. —Tejal Rao",
#       ingredients: ["2 servings as a main course or 4 as a side", "Kosher salt (such as Diamond Crystal)",
#     "¼ cup extra-virgin olive oil, plus more for serving", "2 garlic cloves, smashed flat and peeled",
#   "1 pound lacinato kale, thick ribs removed", "Freshly ground black pepper", "½ pound pasta, like pappardelle or rigatoni", "¾ cup coarsely grated Parmigiano- Reggiano"],
#       preparation: ["Put a large pot of generously salted water over high heat, and bring to a boil. In a small skillet over medium heat, add olive oil and garlic, and cook until the garlic begins to sizzle. Reduce heat to low, and cook very gently until garlic is soft and begins to turn light gold, about 5 minutes. Remove from heat.", 
#       "When water is boiling, add kale leaves, and cook until tender, but not mushy, about 5 minutes. Pull out the hot, dripping kale leaves with tongs, and put directly into a blender. (Don’t drain the pot; you’ll use that same boiling water to cook the pasta.) Add garlic and its oil to the blender, along with a splash of hot water from the pot if you need some more liquid to get the blender going. Blend into a fine, thick green purée. Taste, and adjust seasoning with salt and pepper, then blend again.",
#     "Add the pasta to the still-boiling water, and cook according to directions on the package. Ladle out about a cup of the water to save for finishing the dish, then drain the pasta and return it to the dry pot. Add the kale purée, about ¾ of the grated cheese and a splash of the reserved pasta water. Toss until all the pasta is well coated and bright green, adding another splash of pasta water if needed so that the sauce is loose and almost creamy in texture. Serve in bowls right away, and top with an extra drizzle of olive oil and the rest of the grated cheese."],
#       meal_category: "Sides",
#       org_category: "Quick Pastas",
#       author: "Joshua McFadden",
#       image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/kale-pasta.jpeg"
#     )

#     Recipe.create!(
#       name: "Creamy Chive Pasta With Lemon",
#       cooking_time: "25 minutes",
#       description: "This recipe is a good way to showcase any fresh chives you may have. In the spirit of buttered noodles with chives — or stir-fried lo mein with Chinese chives — this recipe uses the delicate alliums as an ingredient instead of a garnish. Their gentle onion flavor adds freshness to lemon-cream sauce, which is not unlike a delicate sour cream and onion dip. You can use crème fraîche for more tang, heavy cream for an Alfredo vibe, or ricotta for a hint of sweetness. To use another spring allium like ramps, leeks or a combination, thinly slice and simmer in heavy cream (not crème fraîche or ricotta) to soften before adding the other ingredients.",
#       ingredients: ["Yield: 4 servings", "Kosher salt and black pepper", "1 pound long noodles, like linguine or spaghetti",
#     "¾ cup crème fraîche, heavy cream or ricotta", "¾ cup freshly grated Parmesan (1¾ ounces), plus more for serving",
#   "1 tablespoon fresh lemon zest plus 3 tablespoons lemon juice (from 1 to 2 lemons)",
# "¼ to 1½ ounces chives, cut into 1-inch pieces"],
#       preparation: ["Bring a large pot of salted water to a boil. Add the pasta and cook according to package instructions until al dente. Reserve 1 cup pasta cooking water, then drain the pasta.",
#     "In the same pot, make the sauce: Stir together the crème fraîche, ½ cup reserved pasta water, Parmesan, lemon zest and juice, and a pinch of salt and pepper. Add the pasta, return to medium heat, and cook, tossing vigorously, until the noodles are well coated, 1 to 2 minutes. Add more pasta water as needed to gloss the noodles.",
#   "Add the chives and stir until evenly distributed and slightly wilted. Season to taste with salt and pepper. Eat with more grated Parmesan and black pepper on top."],
#       meal_category: "Lunch",
#       org_category: "Quick Pastas",
#       author: "Ali Slagle",
#       image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/chive-lemon-pasta.jpeg"
#     )

#     Recipe.create!(
#       name: "One-Pot Pasta With Sausage and Spinach",
#       cooking_time: "20 minutes",
#       description: "This is the one-pot recipe to make when chopping an onion feels like too much work. Cooking the pasta in a combination of passata (puréed raw tomatoes) and water seasoned with cumin and red-pepper flakes infuses it with flavor all the way through. Cumin adds a subtle earthiness to the dish, but you can also use the same seasonings as those in the sausage you’ve chosen, like dried oregano, thyme, basil, paprika, fennel seeds or garlic. (Check the ingredients list on the package, if you're not sure.) Baby arugula, kale or other leafy greens could be substituted for the spinach, just make sure to tear or cut them into small, bite-size pieces. To make a vegetarian version, you could use mushrooms in place of the sausage at the start of the recipe, then continue with the rest.",
#       ingredients: ["Yield: 4 servings", "1 tablespoon olive oil", "2 sweet or hot Italian sausages (5 to 6 ounces), casings removed",
#     "1 (24-ounce) jar passata or (28-ounce) can crushed tomatoes",
#   "½ teaspoon ground cumin", "½ teaspoon red-pepper flakes", "Kosher salt",
# "1 pound cavatappi, fusilli or other small, tubular pasta", "5 packed cups baby spinach (about 5 ounces)",
# "½ cup grated Parmesan"],
#       preparation: ["Heat the oil in a 12-inch, deep skillet with a tight-fitting lid or a Dutch oven over medium-high until shimmering. Use your hands to pull the sausages apart into small pieces; add to the skillet and cook untouched for 1 minute.",
#     "Continue to cook for another 4 to 6 minutes, stirring at 1-minute intervals and breaking up the sausage into ½-inch chunks, until browned and crispy on the outside with no pink remaining. If you have more than 1 tablespoon of fat in the pan, drain the excess.",
#   "Carefully pour in the passata (it may splatter), then add the cumin, red-pepper flakes and 2 cups water, stirring to combine. Season with salt and increase the heat to bring to a boil.",
# "Add the pasta, coating it with the liquid. (It won’t be fully submerged, and that’s OK.) Adjust the heat to maintain an active simmer with small bubbles forming on the surface. Cover and let cook, stirring every few minutes to make sure nothing is sticking at the bottom of the pan, until the pasta is al dente, about 1 minute less than the package instructions. If the pasta is still hard at this point, add a few tablespoons of warm water at a time and cook until just al dente. Depending on your pasta size and shape, you may need to add several tablespoons of water.",
# "When the pasta is just al dente, reduce the heat to low and season to taste with salt. Stir in the spinach in batches, and cook, uncovered, until most of the spinach is wilted, about 1 minute more. (It will continue to wilt in the heat of the pasta after you serve it.) If the pasta seems too dry, add 1 tablespoon warm water at a time until it reaches your desired consistency.",
# "Divide pasta among serving bowls and top with Parmesan."],
#       meal_category: "Dinner",
#       org_category: "Quick Pastas",
#       author: "Yasmin Fahr",
#       image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/one-pot-sausage-spinach.jpeg"
#     )

#     Recipe.create!(
#       name: "Spaghetti With Burrata and Garlic-Chile Oil",
#       cooking_time: "20 minutes",
#       description: "Burrata — a cousin of mozzarella with a creamy core — is a splurge, but it does all the heavy lifting in this simple dish, adding a rich finish that renders a basic bowl of whole-wheat noodles sophisticated. A spicy-sweet seasoned oil made by sautéing fennel, garlic and red-pepper flakes in good-quality olive oil over low heat is drizzled over the top, complementing the velvety texture of the cheese and the nuttiness of the noodles.",
#       ingredients: ["Yield: 4 to 6 servings", "Kosher salt", "1 teaspoon fennel seeds",
#     "¾ cup extra-virgin olive oil", "1 large head fennel (about 8 ounces), trimmed, cored and thinly sliced",
#   "10 garlic cloves, thinly sliced lengthwise", "¾ teaspoon red-pepper flakes",
# "1 pound whole-wheat spaghetti", "8 ounces burrata cheese", "1 teaspoon flaky sea salt, such as Maldon",
# "Black pepper"],
#       preparation: ["Bring a large pot of generously salted water to a boil. Crack the fennel seeds with the flat side of a large knife or the backside of a heavy skillet. Heat the oil, sliced fennel, garlic, fennel seeds and red-pepper flakes in a large skillet over low. Cook, stirring occasionally, until the garlic and fennel are softened and the oil is deeply flavored, 12 to 15 minutes.",
#     "Meanwhile, cook the pasta according to package directions until al dente. Drain and return pasta to pot. Reserve a few tablespoons of the seasoned oil and fennel mixture, then add the rest to the pot with the pasta and toss to coat.",
#   "Divide the pasta and burrata among four shallow bowls. Spoon the remaining seasoned oil and fennel mixture over the top and season with flaky salt and black pepper to taste."],
#       meal_category: "Lunch",
#       org_category: "Quick Pastas",
#       author: "Sarah Copeland",
#       image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/spaghetti-garlic-burrata.jpeg"
#     )

#     Recipe.create!(
#       name: "Crispy Gnocchi With Burst Tomatoes and Mozzarella",
#       cooking_time: "25 minutes",
#       description: "Pan-fried gnocchi is like a faster version of baked pasta. Store-bought gnocchi can simply be browned in a pan for an exciting mix of crispy outsides and chewy middles, no boiling required. This dish is studded with juicy tomatoes and melty pockets of mozzarella. Cherry tomatoes are reliably more flavorful year-round than larger, more watery varieties like beefsteak and heirloom. (That said, taste yours, and if they’re more tart than sweet, add ½ teaspoon sugar in Step 2.) Toss the tomatoes with browned butter, red-pepper flakes and garlic, then hit them with a little heat, and they’ll burst into a bright sauce. Stir in the gnocchi, dot with mozzarella, then broil until the cheese is molten and the tomatoes are blistered in spots.",
#       ingredients: ["Yield: 4 servings", "2 tablespoons extra-virgin olive oil, plus more as needed",
#     "2 (12- to 18-ounce) packages shelf-stable or refrigerated potato gnocchi", 
#   "¼ cup unsalted butter", "4garlic cloves, thinly sliced", "¼ teaspoon red-pepper flakes, plus more for serving",
# "Kosher salt and black pepper", "2 pints small tomatoes, such as cherry, grape or Sungold",
# "¼ cup thinly sliced or torn basil leaves (optional), plus more for serving",
# "8 ounces fresh mozzarella, cut or torn into ½-inch pieces"],
#       preparation: ["Heat the broiler with a rack about 6 inches from the heat source.",
#     "In a large (12-inch) skillet on the stovetop, heat enough olive oil to lightly coat the bottom of the pan (about 1 tablespoon) over medium-high. Add half the gnocchi to the pan, breaking up any that are stuck together. Cover with a lid or baking sheet and cook, undisturbed, until golden brown on one side, 2 to 4 minutes. Transfer to a medium bowl. Repeat with the remaining gnocchi and olive oil.",
#   "Add the butter to the skillet and cook over medium-high, stirring often, until golden-brown and toasty, 1 to 2 minutes. Add the garlic, red-pepper flakes, 1½ teaspoons salt and a few grinds of pepper, reducing the heat slightly if necessary to avoid scorching. Add the tomatoes and 3 tablespoons water and cook, shaking the pan occasionally, until the tomatoes have softened and the liquid has slightly thickened, 4 to 6 minutes. Smash the tomatoes as they burst to help them along.",
# "Add the seared gnocchi and ¼ cup basil (if using), stir to coat, then shake into an even layer. Top with the mozzarella and drizzle lightly with olive oil. Broil until the cheese is melted and browned in spots, 2 to 4 minutes. Top with more basil, red-pepper flakes and black pepper as desired."],
#       meal_category: "Dinner",
#       org_category: "Quick Pastas",
#       author: "Ali Slagle",
#       image_url: "https://cft-cooking-seeds.s3.us-west-1.amazonaws.com/aws-fullstack-images/crispy-gnocchi.jpeg"
#     )

    # Recipe.create!(
    #   name: "",
    #   cooking_time: "",
    #   description: "",
    #   ingredients: [""],
    #   preparation: [""],
    #   meal_category: "",
    #   org_category: "Quick Pastas",
    #   author: "",
    #   image_url: ""
    # )

    puts "Done!"
  end
