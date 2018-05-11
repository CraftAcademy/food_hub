Feature: Index page shows a list of recipes
  As a user
  In order to see what recipes are available
  I would like to see a list of recipes displayed

Background:
  Given We have the following recipes:
    | title | description     | ingredients           | directions   |
    | Pizza | An italian dish | flour, tomato sauce  | bake in oven |

Scenario: User views recipes on home page
  Given I visit site
  Then I should see "Recipes"
  And I should see "Pizza"
  And I should see "An italian dish"
  And I should see "flour, tomato sauce"
  And I should see "bake in oven"
