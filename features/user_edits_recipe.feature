Feature: User edits recipe
  As a user
  In order to update recipes
  I would like to be able to edit my recipes

 Background:
    Given We have the following recipes
      | title         | description             |
      | Meatball-Stew | This will make you sick |

    Given We have the following user
      | email            | password |
      | maran@test.com   | 12345678 |

  Scenario: User edits a recipe of their own
    Given I am logged in as "maran@test.com"
    And I visit the site
    And I click "Meatball-Stew"
    When I click "Edit Recipe" 
    And I click "Update Recipe"
    Then I should see "You have successfully edit recipe!"
