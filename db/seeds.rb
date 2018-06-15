User.create(
  email: 'nader@example.com',
  password: '123456'
)

User.create(
  email: 'george@example.com',
  password: '123456'
)

Recipe.create(

  title: 'Mini Meatloaves',
  description: 'Quick and easy to make. A family favorite. The ketchup and brown sugar give these loaves a tangy flavor.',
  ingredients: '1 egg
                3/4 cup milk1 cup shredded Cheddar cheese
                1/2 cup quick cooking oats
                1 teaspoon salt1 pound ground beef
                2/3 cup ketchup
                1/4 cup packed brown sugar
                1 1/2 teaspoons prepared mustard',
  directions: 'Preheat oven to 350 degrees F (175 degrees C).
                In a large bowl, combine the egg, milk, cheese, oats and salt. Add the ground beef, mixing well, and form this mixture into eight miniature meatloaves. Place these in a lightly greased 9x13 inch baking dish.
                In a separate small bowl, combine the ketchup, brown sugar and mustard. Stir thoroughly and spread over each meatloaf.
                Bake, uncovered, at 350 degrees F (175 degrees C) for 45 minutes.',
        user: User.find_by(email: 'george@example.com')

)

Recipe.create(
  title: 'Turkey Sliders',
  description: 'Mini turkey burgers made with goat cheese and sun-dried tomatoes! This recipe makes great regular sized burgers, too!',
  ingredients: '1 pound ground turkey
                1/3 cup goat cheese
                1/4 cup sun-dried tomatoes packed in oil, drained and chopped
                1 clove garlic, minced
                1/2 cup panko bread crumbs
                1/4 teaspoon salt
                1/4 teaspoon ground black pepper
                1/8 teaspoon hot chili flakes (optional)
                1/4 cup all-purpose flour
                1/4 cup olive oil
                1/2 cup white wine1
                6 mini dinner rolls',
  directions: 'Mix the ground turkey, goat cheese, sun-dried tomatoes, garlic, panko bread crumbs, salt, pepper, and hot chili flakes together in a large bowl with your hands until evenly mixed. Form the mixture into patties about 3-inches in diameter. Dust each patty lightly with flour on each side. This will allow patties to brown nicely in oil.
              Heat the olive oil in a large skillet over medium-high heat; cook the patties in the hot oil until browned, 2 to 3 minutes per side. Pour the white wine over the patties, place a cover over the skillet, and continue cooking until the sliders are no longer pink inside and the juices run clear, about 5 minutes. Remove the sliders to a plate lined with paper towels to drain. Serve on the mini dinner rolls.',
        user: User.find_by(email: 'george@example.com')
)

Recipe.create(
  title: 'Grandma\'s Chicken Chardon',
  description: 'Delicious chicken coated in bread crumbs and Parmesan cheese. Sooo easy but your guests will never know how hard you didn\'t work!',
  ingredients: '8 skinless, boneless chicken breast halves
                1 eggsalt and pepper to taste
                2 teaspoons garlic powder, divided
                1 cup bread crumbs
                1/2 cup grated Parmesan cheese
                1 pound sliced fresh mushrooms
                1/4 cup butter, melted
                1 tablespoon fresh lemon juice
                1 teaspoon chopped fresh parsley',
  directions: 'Preheat the oven to 375 degrees F (190 degrees C).
In a shallow bowl, beat the egg with salt, pepper and 1 teaspoon garlic powder. In a separate dish, mix bread crumbs with 1 teaspoon of garlic powder and Parmesan cheese. Set aside.
Mix together the melted butter and lemon juice. Pour about 2/3 of the butter mixture into the bottom of a 9x13 inch baking dish. Tilt pan to coat the bottom. Spread mushrooms in an even layer in the bottom of the dish. Dip each chicken breast into the egg mixture, then into the bread crumb mixture. Place on top of the mushrooms. Drizzle remaining butter over the chicken, and sprinkle with parsley.
Bake uncovered for 45 minutes in the preheated oven, until chicken is golden brown and juices run clear.',
        user: User.find_by(email: 'george@example.com')
)

Recipe.create(
  title: 'Roasted Eggplant Pastitsio',
  description: 'This is one of my favorite fall and winter casseroles. It\'ll use up all your bowls, pots, and pans, so be ready for it--but you can also break this into steps and make the meat sauce a day ahead. I often double this and freeze one pan. It\'s my standard family-had-a-new-baby dish to bring to a friend, too.',
  ingredients: 'Meat Sauce:
                1 large eggplant, halved lengthwise
                1 tablespoon olive oil
                1 1/2 cups chopped onions
                1 pound ground lamb1 clove garlic, minced
                1 1/2 teaspoons salt1 teaspoon ground cumin
                1 teaspoon dried oregano
                1/4 teaspoon freshly ground black pepper
                1/4 teaspoon ground cinnamon
                1 (14 ounce) can diced tomatoes
                1 (14 ounce) can crushed tomatoes
                1 tablespoon chopped fresh mint
                White Sauce:
                2 eggs
                2 tablespoons unsalted butter
                2 tablespoons all-purpose flour
                2 cups milk1 clove garlic, lightly crushed
                1 (8 ounce) package crumbled feta cheese
                1/2 teaspoon saltblack pepper to taste
                1 pinch freshly grated nutmegcooking spray
                1 (12 ounce) package penne pasta',
  directions: 'Set oven rack about 6 inches from the heat source and preheat the oven\'s broiler. Line a baking sheet with aluminum foil; place eggplant halves on top.
                Broil eggplant, checking fairly often and rotating the baking sheet as needed, until the skin blackens and starts to char in places, about 15 minutes. Cool until easily handled, about 5 minutes. Peel off skin and coarsely chop flesh.
                Heat olive oil in a large skillet over medium heat. Add onions; cook and stir over medium heat until onion is translucent, about 5 minutes. Add lamb and cook, breaking it up into small pieces, until no pink remains, about 5 minutes. Drain grease from the skillet.
                Stir minced garlic, salt, cumin, oregano, pepper, and cinnamon into the skillet; cook for 1 minute. Stir in chopped eggplant, diced tomatoes, and crushed tomatoes. Bring sauce to a simmer and cook until thickened, about 20 minutes. Remove from heat and stir in chopped mint.
                Melt butter in a saucepan over medium heat. Stir in flour and cook, stirring constantly, for 2 minutes. Pour in milk and whisk until smooth. Add crushed garlic clove, increase heat to high, and bring milk to a boil. Reduce heat and simmer, stirring frequently, until slightly thickened, about 5 minutes more. Remove from heat; discard garlic clove.
                Whisk eggs in a large heatproof bowl. Pour hot milk mixture in a steady stream into beaten eggs, whisking constantly. Stir in feta cheese, salt, pepper, and nutmeg.
                Preheat oven to 425 degrees F (220 degrees C). Spray a 9x13-inch baking dish with cooking spray.
                Bring a large pot of salted water to boil. Add pasta and cook, stirring occasionally, until tender yet firm to the bite, about 12 minutes. Drain.
                Divide pasta between the white sauce and the lamb sauce and mix to combine. Pour the pasta with lamb sauce into the prepared baking dish; spread the pasta with white sauce on top.
                Bake in the preheated oven until top is golden and pastitsio is bubbling, about 30 minutes. Let cool for 5 minutes before serving.',
        user: User.find_by(email: 'george@example.com')
)
