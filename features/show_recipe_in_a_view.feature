Feature: Show recipe in a view (User views recipe in detail)
  As a user
  In order read recipes
  I should be able to view a single recipe with all details

  Background:
    Given We have the following recipes:
      | title       	| description                 | ingredients        | directions              |
      | Meatball-Stew | This will make you sick     | Meat, onion, stuff | Stir it, mix it, eat it |


  Scenario: User views recipe in detail
    Given I visit the site
    And I click "Meatball-Stew"
    And I should see "Meatball-Stew"
    Then I should see "This will make you sick"
    And I should see "Meat, onion, stuff"
    And I should see "Stir it, mix it, eat it"
