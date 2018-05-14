Feature: Index page shows a list of recipes
  As a user
  In order to see what recipes are available
  I would like to see a list of recipes displayed

Background:
  Given We have the following user:
    | email           | password    |
    | maran@test.com  | 12345678    |
  Given We have the following recipes:
    | title | description     | ingredients           | directions   | user            |
    | Pizza | An italian dish | flour, tomato sauce  | bake in oven  | maran@test.com  |

Scenario: User views recipes on home page
  Given I visit the site
  Then I should see "Recipes"
  And I should see "Pizza"
  And I should see "An italian dish"
