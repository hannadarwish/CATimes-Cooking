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

    Recipe.create!(
      name: 'Toasted Sesame and Citrus Wedding Cake',
      cooking_time: '18 hours',
      description: "Everyone loves receiving a homemade gift, but how about a showstopping, two-tiered, citrus-festooned, sesame-laced wedding cake? With a little planning (and an organized freezer), it’s so much easier than you think. Thin, even layers of vanilla sponge cake, soaked with a vivid citrus syrup, are draped like lasagna sheets into pans, along with swaths of nutty sesame buttercream, charred citrus compote and a granola-adjacent sesame crunch. The cake rests while you do, then is removed from the pans, coated in buttercream, packed up and assembled the day of the wedding. There's no finer — or more delicious — way to allow the effort, care and creativity of its maker to come through. And don’t forget to save and freeze the excess cake scraps for ice cream sandwiches, trifles or snacking.",
      ingredients: "Yield:
      About 60 servings
      FOR THE VANILLA CHIFFON CAKE
      12large cold eggs
      1cup/240 grams neutral oil, like grapeseed
      2tablespoons vanilla extract
      4cups/800 grams granulated sugar
      3½cups/480 grams all-purpose flour
      2tablespoons plus 2 teaspoons baking powder
      2teaspoons kosher salt (such as Diamond Crystal) or 1 teaspoon fine sea salt
      FOR THE SESAME CRUNCH
      Nonstick cooking spray
      4large egg whites
      ½packed cup/120 grams light brown sugar
      1teaspoon vanilla extract
      ½teaspoon kosher salt (such as Diamond Crystal) or ¼ teaspoon fine sea salt
      1¾cups/226 grams toasted white sesame seeds
      FOR THE CHARRED CITRUS COMPOTE
      2large navel oranges
      3lemons or Meyer lemons
      1½cups/300 grams granulated sugar
      ½teaspoon citric acid, plus more to taste (optional; see Tip)
      FOR THE CHARRED CITRUS SOAK
      ½cup/120 grams fresh lemon juice
      ⅓cup/70 grams granulated sugar
      FOR THE TOASTED SESAME BUTTERCREAM
      12large egg whites
      3cups/600 grams granulated sugar
      1cup/150 grams confectioners’ sugar
      1tablespoon vanilla extract
      1teaspoon kosher salt (such as Diamond Crystal) or ½ teaspoon fine sea salt, plus more if needed
      2pounds/912 grams unsalted butter, cut into tablespoons, at room temperature
      1tablespoon toasted sesame oil
      1cup/240 grams tahini
      TO DECORATE
      Assortment of fresh citrus, such as small tangerines, lemons and kumquats, washed and scrubbed
      Fresh food-safe greenery, such as bay leaves or olive branches",
      preparation: "PREPARATION
      PREPARE THE CHIFFON CAKE LAYERS
      
      Step 1
      Heat oven to 350 degrees. Line the bottoms of 3 half-sheet pans (13-by-18-by-1-inch) with sheets of parchment.
      
      Step 2
      Carefully crack eggs into a bowl without breaking the yolks. Pluck out yolks one at a time with clean fingertips, transferring to a large bowl. Transfer the egg whites to the bowl of a stand mixer; set aside. To yolks, add 1 cup/240 grams water, the oil, vanilla and 3 cups/600 grams granulated sugar; whisk until smooth.
      
      Step 3
      In a very large bowl, whisk flour, baking powder and salt. Pour yolk mixture into dry ingredients and gently stir to combine. (Small lumps are OK.)
      
      Step 4
      Using the whisk attachment, beat egg whites in the stand mixer on medium-high speed until a soft peak forms, about 2 minutes. With the mixer running, stream in remaining 1 cup/200 grams granulated sugar and continue whisking until a glossy, floppy meringue forms, another 3 to 4 minutes.
      
      Step 5
      Scrape one-third of the meringue into yolk mixture and gently fold with a spatula until mixture is loosened. Add remaining meringue and fold until batter feels billowy and some white streaks remain. Divide batter evenly among prepared pans. Smooth the surfaces evenly with an offset spatula and transfer to the oven, working in batches if needed.
      
      Step 6
      Bake until centers of cakes spring back to the touch and edges are lightly golden, about 18 minutes. If oven heat is uneven, switch the positions of the pans halfway through. Let cakes cool completely in pans until ready to use. The cakes, tightly wrapped in their pans, can be refrigerated for up to 1 week, or frozen for up to 1 month.
      
      PREPARE THE SESAME CRUNCH
      
      Step 1
      If the oven is off, heat to 350 degrees. Line a 13-by-18-inch sheet pan with a sheet of parchment and coat with nonstick spray.
      
      Step 2
      In a medium bowl, whisk egg whites, light brown sugar, vanilla and salt until glossy, about 3 minutes. Stir in sesame seeds. Pour batter onto prepared pan and smooth to the edges with a small offset spatula.
      
      Step 3
      Bake for 6 minutes. Remove from oven and use a bench scraper or butter knife to chop. Bake for another 5 to 6 minutes, or until pieces no longer feel sticky.
      
      Step 4
      Let sesame crunch cool completely in the pan; it will continue to crisp as it rests. If it still seems chewy after cooling, bake for an additional 3 to 4 minutes. Finely chop into tiny clusters. The sesame crunch can be stored in an airtight container at room temperature for up to 2 weeks, or in the freezer for up to 1 month.
      
      PREPARE THE CITRUS COMPOTE
      
      Step 1
      Wash and scrub the oranges and lemons. Cut each in half crosswise. Heat a large pot or Dutch oven over medium-low and add fruit, cut sides down. They should sizzle upon contact. Let sear, undisturbed, for about 10 minutes, until the cut sides of the fruit are blackened in spots. Use tongs to carefully flip each piece and continue to cook for another 10 minutes, until the peel is softened and charred in spots.
      
      Step 2
      Transfer citrus to a cutting board to cool. Add 8 cups water to the pot, scrape the bottom and bring water to a simmer.
      
      Step 3
      Peel the fruit, and reserve citrus segments. (You should have about 2 cups segments.) Roughly chop peels.
      
      Step 4
      Add chopped peels to the simmering water and simmer, stirring occasionally, until peels are tender, 10 to 15 minutes. Drain peels in a colander, discarding the water.
      
      Step 5
      Press citrus segments through a strainer into a small bowl to yield ½ cup juice. Set juice aside for the charred citrus soak (see Make the Citrus Soak).
      
      Step 6
      Transfer spent pulp in the strainer to the pot, and add granulated sugar, cooked peels and 1 cup/240 grams water. Bring to a simmer over medium-low heat and cook, stirring occasionally, until mixture is thickened and saucy, 25 to 30 minutes. If mixture looks tight or dry, add ¼ cup/60 grams water at a time and continue to cook until peels are tender.
      
      Step 7
      Remove from heat and use an immersion blender or food processor and pulse until the mixture is smoothed out but retains a little texture. Stir in citric acid, if using. The compote should taste sweet and sour. Add more citric acid if desired. Let cool completely. The compote can be stored in an airtight container in the refrigerator for up to 2 weeks, or in the freezer for up to 1 month.
      
      MAKE THE CITRUS SOAK
      
      Step 1
      Make the citrus soak: Combine ½ cup reserved charred citrus juice (see Step 5 of Prepare the Citrus Compote) with ½ cup/120 grams water, the fresh lemon juice and granulated sugar in a small saucepan. Gently warm over low heat, stirring occasionally, until sugar melts, about 5 minutes. Cool completely. The soak can be refrigerated in an airtight container for up to 1 week, or frozen for up to 1 month. Thaw before use.
      
      PREPARE THE BUTTERCREAM
      
      Step 1
      Add egg whites and granulated sugar to a stand mixer bowl or other large heatproof bowl and set over a medium saucepan of steaming water set over low heat. (The water should not touch the bottom of the bowl.) Whisk continuously until mixture registers 155 degrees, about 10 minutes.
      
      Step 2
      Remove the bowl from the pot and fit into the stand mixer with the whisk attachment. Whisk on medium-high speed until the mixture has cooled slightly, about 4 minutes. Add confectioners’ sugar and mix on low speed to combine. Mix in vanilla and salt.
      
      Step 3
      Check the temperature of the meringue with a clean fingertip: It should be room temperature. With the mixer on medium speed, add butter, piece by piece, until fully incorporated, then increase speed to medium-high and whisk until smooth and fluffy, another 3 to 5 minutes.
      
      Step 4
      If the buttercream looks runny, refrigerate for 10 to 15 minutes to cool and then beat again until it is creamy and spreadable. With machine running, add sesame oil and mix to combine, then add tahini and whisk just until incorporated. Taste and add more salt if desired. The buttercream can be refrigerated in an airtight container for up to 2 weeks, or frozen for up to 1 month. If frozen, thaw overnight in the refrigerator, then bring to room temperature before use (this will take at least 2 hours and possibly more).
      
      ASSEMBLE THE CAKE TIERS
      
      Step 1
      Line an 8-inch round cake form or pan (at least 3 inches deep) with plastic wrap, being sure to leave plenty of overhang. Repeat with a 10-inch round cake form or pan (also at least 3 inches deep). Peel off and discard parchment from cake layers.
      
      Step 2
      Cut out the 8-inch cake rounds: Using the bottom of the 8-inch pan as a guide, trace and cut out an 8-inch circle with a small serrated knife on the upper left corner of one of the cake sheets. Trace and cut another 8-inch circle on the lower right corner of the sheet. Trace and cut a half-moon shape on the upper right corner of the sheet, and then the lower left corner. Lay those half-moons over a whole circle and cut out strips of cake from the scraps to complete the circle. You will have three 8-inch rounds total (including the two half-moons and their cake strips).
      
      Step 3
      Build the 8-inch cake tier: Invert one cake round into the bottom of the plastic wrap-lined pan. Brush cake with 3 tablespoons citrus soak. Spoon ¾ cup buttercream on top, and spread it evenly with a small offset spatula. Dollop ½ cup citrus compote on top of buttercream. Scatter about ¾ cup sesame crunch on top.
      
      Step 4
      Arrange the two half-moons and strips of cake on top to form the second 8-inch cake layer. Apply another 3 tablespoons citrus soak, then ¾ cup buttercream, followed by another ½ cup citrus compote, plus another ¾ cup sesame crunch. Place the remaining 8-inch cake round on top and brush on 3 tablespoons citrus soak. Wrap the cake pan securely with plastic wrap and refrigerate for at least 12 hours.
      
      Step 5
      Cut out the 10-inch cake rounds: Using the bottom of the 10-inch pan as a guide, trace and cut a 10-inch circle with a small serrated knife on the left side of one of the cake sheets. Trace and cut part of another 10-inch circle on the right side and a smaller crescent moon on one of the edges. Lay the partial pieces over the whole circle and cut cake scraps to fill in the gaps. Repeat with the third sheet of sponge; you will have four 10-inch rounds total.
      
      Step 6
      Next, build the 10-inch cake tier: Invert one cake round in the bottom of the plastic wrap-lined pan. Brush cake with ¼ cup citrus soak. Spoon 1 cup buttercream on top, and spread it evenly with a small offset spatula. Dollop ⅔ cup citrus compote on top. Scatter about 1¼ cups sesame crunch on top.
      
      Step 7
      Place a cake layer with a missing edge on next and complete the round with its matching pieces. Apply another ¼ cup citrus soak, then 1 cup buttercream, followed by another ⅔ cup compote, plus another 1¼ cups sesame crunch. Repeat this sequence with a third layer of cake and its matching pieces, then place the remaining whole 10-inch cake round on top, and brush on the remaining ¼ cup citrus soak. Wrap the cake pan securely with plastic wrap and refrigerate for at least 12 hours. Both cake tiers can be refrigerated for up to 3 days or, preferably, frozen for up to 3 weeks.
      
      Step 8
      Refrigerate the remaining buttercream until ready to apply. If the cakes have been frozen, they do not need to thaw. Completely frozen cakes are more stable and easier to handle and frost.
      
      FROST THE CAKE TIERS
      
      Step 1
      Let the reserved refrigerated buttercream sit at room temperature for an hour, then whisk with a stand mixer until fluffy and spreadable, about 3 minutes.
      
      Step 2
      Invert the 8-inch cake onto an 8- to 8½-inch cardboard cake round set on top of a baking sheet. Remove the cake form or pan, then peel off the plastic wrap. Dollop 2 cups buttercream on top and use an offset spatula to spread it all the way to the edges of the cake.
      
      Step 3
      Dab 1 cup buttercream on the sides of the cake, smoothing each dab to touch the one before, until none of the cake is visible. Once the sides of the cake are roughly covered in buttercream, run the offset spatula along the top surface again to smooth it out. Run the offset again along the sides of the cake, where excess buttercream will have gathered, to pull away any excess frosting; the cardboard cake round should not be visible. Refrigerate the cake uncovered while you frost the second cake.
      
      Step 4
      Invert the 10-inch cake onto an 11- to 12-inch cardboard cake round, large flat serving platter or decorative cutting board. Remove the cake form or pan, then peel off the plastic wrap. Dollop 2 cups buttercream on top and use an offset spatula to spread it all the way to the edges of the cake.
      
      Step 5
      Dab 2 cups buttercream on the sides of the cake, smoothing each dab to touch the one before, until none of the cake is visible. Once the sides of the cake are roughly covered in buttercream, run the offset spatula along the top again to smooth it out. Run the offset again along the sides of the cake, where excess buttercream will have gathered, to pull away any excess frosting. Refrigerate uncovered for at least 1 hour before stacking the tiers. The tiers can be refrigerated separately for up to 2 days.
      
      ASSEMBLE THE WEDDING CAKE
      
      Step 1
      If the wedding is in another location, transport the separate tiers in deep cardboard boxes or crates to the venue. To assemble, simply place the 8-inch tier with its cardboard base on top of the 10-inch cake. Decorate the edges and sides of the cake with the fresh citrus and greenery. The cake can be displayed in a shaded, cool outdoor space or in a cool or air-conditioned indoor space for up to 5 hours. Do not let the assembled cake sit in direct sun for longer than an hour. The cake is not in danger of collapsing or shifting because the tiers are so wide, but the buttercream may melt in a warm setting.
      
      WHEN READY TO SERVE, CUT THE CAKE
      
      Step 1
      Using a chef’s knife, cut the 8-inch cake into thirds by making two parallel slices, then cut crosswise into 1-inch-thick pieces, wiping the knife clean between each new cut. Cut the 10-inch cake into quarters by making three parallel slices, then cut those pieces crosswise into 1-inch-thick pieces. The 8-inch cake yields about 24 small slices; the 10-inch cake about 36 slices.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Natasha Pickowicz",
      image_url: "https://static01.nyt.com/images/2023/06/02/multimedia/02-WEDDING-REX1-qcgf/02-WEDDING-REX1-qcgf-articleLarge.jpg?w=1280&q=75"
    )

    Recipe.create!(
      name: "Chocolate-Chocolate Birthday Cake",
      cooking_time: "3 hours",
      description: "This is the birthday cake I’ve made for my son since he was about 11. After boxed cakes, ice-cream cakes, a cake in a Darth Vader mold (that year, the party’s theme was “May the Fours Be With You), this cake hit the spot and remains a favorite. It’s a double-layer devil’s-food cake made with cocoa and bittersweet chocolate, the same pair that makes the frosting so luscious.  You can make the layers ahead of time, wrap them and freeze them for up to a month.  As for the frosting, it’s best spread between the layers and over the cake when it’s just made. Once assembled, the cake can be refrigerated overnight. It cuts most easily when it’s cold but tastes best when it’s at room temperature, which is about what it will be once the candles are blown out and the slices put on plates. Ice cream alongside is unnecessary but nice. Hey, it’s a birthday!",
      ingredients: "Yield:
      12 to 14 servings.
      FOR THE CAKE
      2sticks (226 grams) unsalted butter, at room temperature (plus more for the pan)
      ⅔cup (56 grams) unsweetened cocoa powder (plus more for the pan)
      2cups (272 grams) all-purpose flour
      1½teaspoons baking powder
      ½teaspoon baking soda
      ½teaspoon fine sea salt
      1¼cups (250 grams) sugar
      4large eggs, at room temperature
      2teaspoons pure vanilla extract
      1cup (240 ml.) buttermilk, well shaken
      4ounces (113 grams) bittersweet chocolate, melted and cooled
      FOR THE FROSTING
      3⅓cups (405 grams) confectioners’ sugar
      4½tablespoons unsweetened cocoa powder
      ½teaspoon fine sea salt
      3sticks (339 grams) unsalted butter, at room temperature
      6ounces (170 grams) bittersweet chocolate, melted and cooled
      4½tablespoons buttermilk
      Small decorations to scatter over the cake, optional",
      preparation: "Step 1
      Center a rack in the oven, and preheat it to 350. Butter the interiors of two 9-inch round cake pans, dust with a little cocoa powder and tap out the excess. Sift together the flour, cocoa, baking powder, baking soda and salt.
      
      Step 2
      Working with an electric mixer (use the paddle, if you have one), beat the butter and sugar together on medium speed for 3 minutes, until light and fluffy. Add the eggs one by one, and beat for a minute after each goes in; beat in the vanilla. Reduce the speed to low, and add the dry ingredients in 3 additions and the buttermilk in 2 (start and finish with the dry, and don’t worry if the buttermilk makes the batter look slightly curdled). Mix in the melted chocolate. Divide the batter evenly between the pans.
      
      Step 3
      Bake for 24 to 28 minutes, until a tester poked into the center of the cakes comes out clean. Transfer to racks, let rest 5 minutes and then run a blunt knife around the edges of the pans. Unmold the cakes onto the racks, and cool to room temperature.
      
      Step 4
      Make the frosting: Sift together the confectioners’ sugar and cocoa powder. Using an electric mixer (with the paddle, if available), beat the sugar, cocoa, salt and butter on high speed until fluffy. On low speed, add the chocolate. When it’s almost incorporated, beat in the buttermilk. It’s best to use the frosting immediately.
      
      Step 5
      If necessary, just before you’re ready to frost the cakes, slice a sliver off the top of each layer to create a flat surface. To assemble, place one cake layer, top up, on a serving platter, and cover with frosting. Top with the second layer, top down, jiggling it into the frosting to hold it in place. Frost the top and sides of the cake — go sleek or swirly. If you’re using decorations, scatter them over the cake. Chill for at least 1 hour (or for up to 1 day); bring to room temperature before serving.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Dorie Greenspan",
      image_url: "https://static01.nyt.com/images/2018/05/13/magazine/13OnDessert/13OnDessert-articleLarge-v2.jpg?w=1280&q=75"
    )

    Recipe.create!(
      name: "Red Velvet Cake",
      cooking_time: "1 hour",
      description: "This is similar to the original recipe that began the red velvet craze. It was developed by the Adams Extract company in Gonzales, Tex. The original recipe, popularized in the 1940s, called for butter flavoring and shortening and is usually iced with boiled milk, or ermine, frosting.",
      ingredients: "Yield:
      One 9-inch cake
      ½cup/115 grams butter, at room temperature, plus 2 tablespoons to prepare pans
      3tablespoons/20 grams cocoa powder, divided
      1½cups/300 grams granulated sugar
      2eggs
      2teaspoons/10 milliliters vanilla extract
      2tablespoons/30 milliliters red food coloring
      1teaspoon/6 grams salt
      1teaspoon/5 grams baking soda
      2½cups/320 grams flour, sifted
      1cup/240 milliliters whole buttermilk
      1tablespoon/15 milliliters vinegar
      Ermine icing (see recipe), or other fluffy white icing",
      preparation: "Step 1
      Heat oven to 350 degrees. Prepare three 9-inch cake pans by buttering lightly and sprinkling with 1 tablespoon sifted cocoa powder, tapping pans to coat and discarding extra cocoa. (This recipe can also be made in 2 9-inch cake pans.)
      
      Step 2
      Cream butter and sugar together. Add eggs one at a time and beat vigorously until each is incorporated. Mix in vanilla.
      
      Step 3
      In a separate bowl, make a paste of the remaining 2 tablespoons cocoa and the food coloring. Blend into butter mixture.
      
      Step 4
      Sift together remaining dry ingredients. Alternating in 2 batches each, add dry ingredients and buttermilk to the butter mixture. In the last batch of buttermilk, mix in the vinegar before adding to the batter. Mix until blended.
      
      Step 5
      Divide batter among 3 pans and bake for about 20 to 25 minutes. Cool on a rack completely.
      
      Step 6
      To assemble, remove 1 cake from its pan and place flat side down on a serving platter. Drop about 1 cup of icing onto cake and, using a flat spatula, spread evenly over top. Remove the second cake from its pan. Place flat side down on top of first layer. Use remaining frosting to cover top and sides of cake.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Kim Severson",
      image_url: "https://static01.nyt.com/images/2014/05/14/dining/14REDVELVET/14REDVELVET-articleLarge-v4.jpg?w=1280&q=75"
    )

    Recipe.create!(
      name: "Pumpkin Layer Cake With Caramel Buttercream",
      cooking_time: "2 hours",
      description: "Warmly spiced pumpkin cake and toasty caramel are a natural pair in this fall showstopper. The cake is light and fluffy with just enough spice to highlight the pumpkin flavor, while a generous pour of caramel sauce between the layers adds richness. (Store-bought caramel sauce will also work, but expect a slightly sweeter result.) For an impressive presentation, top the frosted cake with a bit more caramel sauce, and let it trail down the sides. It’s just the thing for a fall birthday treat or the Thanksgiving table.",
      ingredients: "Yield:
      10 to 12 servings
      FOR THE CAKE
      2½cups plus 2 tablespoons/330 grams cake flour
      1½teaspoons baking powder
      1½teaspoons baking soda
      1¾cups/350 grams granulated sugar
      1cup/225 grams unsalted butter, softened
      1tablespoon cinnamon
      1½teaspoons ground cardamom
      ¼teaspoon freshly grated nutmeg
      ¼teaspoon ground allspice
      1teaspoon kosher salt
      3large eggs, at room temperature
      2teaspoons vanilla extract
      2½cups/610 grams pumpkin purée, at room temperature
      FOR THE CARAMEL SAUCE (SEE NOTE)
      1cup/200 grams granulated sugar
      2tablespoons unsalted butter, softened
      ¾cup/180 milliliters heavy cream, at room temperature
      1tablespoon whiskey or 2 teaspoons vanilla extract
      ½teaspoon kosher salt
      FOR THE BUTTERCREAM
      4large egg whites
      1cup/200 grams granulated sugar
      2cups/450 grams unsalted butter, softened and cut into tablespoons
      Pinch of kosher salt",
      preparation: "Step 1
      Heat oven to 350 degrees. Butter three 8-inch cake pans and line the bottoms with parchment paper. Flour the pans and paper.
      
      Step 2
      Sift the flour, baking powder and baking soda into a large bowl.
      
      Step 3
      In the bowl of a stand mixer fitted with the paddle attachment, combine the sugar, butter, spices and salt. Beat on medium-high until very light and fluffy, about 5 minutes. Stop the mixer occasionally to scrape the bottom and sides of the bowl. Add the eggs one at a time, mixing for about 20 seconds between each egg. Add the vanilla extract and pumpkin purée and mix until well combined, scraping the bottom and sides of the bowl as necessary. The mixture will look curdled.
      
      Step 4
      Set mixer to low, and add the dry ingredients all at once, stirring until a few spots of flour remain. Remove the bowl from the mixer, and use a rubber spatula to finish folding the dry ingredients into the batter. Scrape the bottom and sides of the bowl to ensure the batter is evenly mixed.
      
      Step 5
      Divide the batter among the prepared pans (about 3 cups per pan), smooth the tops, and tap the pans on a countertop to release any large air bubbles. Bake the cakes until golden and puffed, and a tester inserted into the center comes out clean, 20 to 25 minutes.
      
      Step 6
      Cool the cakes in the pans on a rack for 10 minutes, then use the tip of a knife to loosen the edges and carefully invert them onto the rack to cool completely.
      
      Step 7
      Meanwhile, make the caramel sauce: In a large saucepan over medium-high heat, combine the sugar and 3 tablespoons water. Swirl the pan occasionally until the sugar dissolves, but do not stir. Continue to cook, swirling the pan occasionally to help the mixture brown evenly, until it is deep amber in color. At this point, don't walk away from the pot: The caramel will go from amber to burned in mere moments.
      
      Step 8
      Remove the pan from the heat, and carefully whisk in butter and heavy cream. The mixture will expand and sputter before turning into a smooth sauce. Add the whiskey and salt. Carefully pour the caramel into a heat-safe container and cool to room temperature. You will have about 1½ cups.
      
      Step 9
      Make the buttercream: In the bowl of a stand mixer, combine the egg whites and sugar. Set the bowl over a pot of simmering water, and whisk continuously until the sugar has dissolved and the mixture is hot to the touch, 5 to 7 minutes.
      
      Step 10
      Use the whisk attachment of the stand mixer to beat the egg white mixture until stiff, glossy peaks form and the mixture and bowl are cool to the touch, about 10 minutes.
      
      Step 11
      Switch to the paddle attachment and reduce speed to medium. With the mixer running, add the butter a couple of tablespoons at a time and beat the buttercream until smooth and fluffy. During this step, the buttercream will likely break and look curdled; turn up the speed on the mixer for a few seconds, and it will come back together. Continue until all of the butter is incorporated then add the salt. Slowly add ½ cup cooled caramel sauce, and stir until well combined. If the buttercream is extremely soft or runny, put the bowl in the refrigerator for about 10 minutes, then whip until smooth.
      
      Step 12
      Assemble the cake: If necessary, use a serrated knife to trim the cooled cake layers so they are flat and even. Add a small spoonful of buttercream onto a cardboard cake round or serving plate, and place the first layer of cake, cut side up, on top.
      
      Step 13
      Spread about ¾ cup buttercream on top of the cake. Drizzle the buttercream with 1 tablespoon of caramel sauce. Be careful not to drizzle the caramel all of the way to the edge so it doesn’t spill out the sides.
      
      Step 14
      Place the second cake layer on top and repeat with buttercream and caramel. Place the final layer on top, cut side down, and spread the top and sides of the cake with a thin, even layer of buttercream. Refrigerate the cake until the buttercream is firm, about 30 minutes.
      
      Step 15
      Spread the remaining buttercream in an even layer over the cake. If you’d like to add a caramel drizzle, refrigerate the fully frosted cake until firm then carefully spread about ⅓ cup of room temperature caramel sauce over the top of the cake. Use an offset spatula to gently ease it towards the edges so it drips down the sides. Serve at room temperature. Store leftover cake in the refrigerator, but bring to room temperature before serving. Leftover caramel sauce can be stored in an airtight container in the refrigerator.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Yossy Arefi",
      image_url: "https://static01.nyt.com/images/2018/11/06/dining/ya-pumpkin-caramel-cake/ya-pumpkin-caramel-cake-articleLarge.jpg?w=1280&q=75"
    )

    Recipe.create!(
      name: "Hummingbird Cake",
      cooking_time: "1 hour",
      description: "This super-simple tropical cake contains a hefty amount of mashed bananas and crushed pineapple. Often associated with the American South, where it is believed to have adopted a cream cheese frosting, it most likely originated in Jamaica, where it was called a Doctor Bird Cake. (“Doctor bird” is the nickname of Jamaica’s national bird, the red-billed streamertail hummingbird.) Some say this cake is sweet enough to attract even hummingbirds, while others say the name derives from how bananas, a key ingredient in the cake, resemble the bird’s beak. The end result tastes similar to banana bread, but with the moistness and flavor of a spice-filled carrot cake.",
      ingredients: "Yield:
      12 servings
      FOR THE CAKE
      Nonstick baking spray
      3¾cups/480 grams all-purpose flour
      2teaspoons ground cinnamon
      1teaspoon baking soda
      1teaspoon kosher salt
      3large eggs, at room temperature
      1½cups/340 grams overripe mashed bananas (about 3 bananas)
      1packed cup/220 grams dark brown sugar
      1cup/200 grams granulated sugar
      1cup/240 milliliters vegetable oil
      2teaspoons vanilla extract
      2(8-ounce/227-gram) cans crushed pineapple in juice (about 1¾ cups)
      ¾cup/85 grams chopped toasted pecan halves
      FOR THE FROSTING
      2(8-ounce/226-gram) packages cream cheese, at room temperature
      1cup/225 grams unsalted butter (2 sticks), at room temperature
      7⅓cups/905 grams confectioners’ sugar
      4teaspoons vanilla extract
      Heaping ¾ cup/85 grams toasted pecan halves, for garnish
      Dried pineapple rings and edible flowers, for garnish",
      preparation: "Step 1
      Prepare the cake: Heat oven to 350 degrees. Grease three (9-inch) cake pans with nonstick baking spray. In a large bowl, whisk together the flour, cinnamon, baking soda and salt. In a second large bowl, whisk together the eggs, mashed bananas, sugars, oil and vanilla.
      
      Step 2
      Make a well in the dry ingredients and add the wet ingredients to the center of the well. Gently fold using a rubber spatula to combine. Add the pineapple and pecans, and fold again until just incorporated.
      
      Step 3
      Divide the batter evenly among the cake pans. Bake until golden, cooked through and an inserted toothpick comes out clean, 25 to 30 minutes. Move the cakes to a wire baking rack to cool in the pans for 10 minutes. Then, remove from the pans and allow to cool completely on the wire racks
      
      Step 4
      As cakes cool, make the cream cheese frosting: In a stand mixer fitted with the paddle attachment, add the cream cheese, butter, confectioners’ sugar and vanilla. Mix on low speed until all the ingredients just come together. Then, increase the speed to medium and mix until creamy and smooth, about 5 minutes.
      
      Step 5
      Assemble the cake: Place the first layer of the cake top-side down onto a cake stand or plate. Spread the top with cream cheese frosting. Repeat with the second two layers, always placing the top side down to create a very flat surface. Frost the top and sides of the cake.
      
      Step 6
      Place whole toasted pecan halves around the rim of the cake. Garnish with the dried pineapple and edible flowers, as desired. Slice and serve.",
      meal_category: "Dessert",
      org_category: "Lovely Layer Cakes",
      author: "Vallery Lomas",
      image_url: "https://static01.nyt.com/images/2021/05/07/dining/vl-hummingbird-cake/vl-hummingbird-cake-articleLarge.jpg?w=1280&q=75"
    )

    # Recipe.create!(
    #   name: "",
    #   cooking_time: "",
    #   description: "",
    #   ingredients: "",
    #   preparation: "",
    #   meal_category: "",
    #   org_category: "Lovely Layer Cakes",
    #   author: "",
    #   image_url: ""
    # )

    puts "Done!"
  end
