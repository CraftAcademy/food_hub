Feature: User creates new recipe
  As a user
  In order to contribute to the site
  I should be able to add new recipe

  Background:
    Given We have the following user:
      | email          | password |
      | maran@test.com | 12345678 |

  Scenario: User adds a recipe
    Given I visit the login page
    And I fill in "Email" with "maran@test.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    And I visit the site
    And I click "New Recipe"
    And I fill in "Title" with "Cheesy Fungus"
    And I fill in "Description" with "Shroomlovin' cheese feast!"
    And I fill in "Ingredients" with "Cheese and fungus"
    And I fill in "Directions" with "Mix it, stir it, eat it!"
    And I click "Create Recipe"
  
