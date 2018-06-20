Feature: Index page shows a list of recipes
  As a user
  In order to see what recipes are available
  I would like to see a list of recipes displayed

Background:
  Given We have the following user:
    | email           | password    |
    | maran@test.com  | 12345678    |

  And We have the following recipes:
    | title | description     |   user          | image     |
    | Pizza | An italian dish | maran@test.com  | pizza.png |

Scenario: User views recipes on home page
  Given I visit the site
  Then I should see "Recipes"
  And I should see "Pizza"
  And I should see "An italian dish"
  And I should see the "pizza.png" image
