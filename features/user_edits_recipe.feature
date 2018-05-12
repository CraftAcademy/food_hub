Feature: User edits recipe
  As a user
  In order to update recipes
  I would like to be able to edit my recipes

 Background:
    Given We have the following recipes
      | title         | description             | 
      | Meatball-Stew | This will make you sick |

    Given We have the following user
      | name   | email            | password |
      | Maran  | maran@test.com   | 12345678 |

  Scenario: User edits a recipe of their own
   
    Given I am logged in as "maran@test.com"
    And I visit the site
    When I click "Recipes" 
    And I click "Meatball-Stew"
    And I click "Edit"
    Then I should be redireced to edit recipe page
    When I click "Save"
    Then I should see "You have succsessfully edit recipe!"

