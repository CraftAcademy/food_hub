Feature: User can rate recipes
  As a user
  In order to evaluate recipes
  I would like to be able to rate recipes

Background:
  Given We have the following user:
    | email           |
    | maran@test.com  |

  Given We have the following recipes:
    | title       	| user            |
    | Meatball-Stew | maran@test.com  |

@javascript
Scenario: User can rate a recipe when visiting the recipe page
  Given I am logged in as "rater@test.com"
  And I am on the "Meatball-Stew" recipe show page
  And I click "4" on rating
  Then I should see the notice: "Thank you for your rating"
  And the average rating for "Meatball-Stew" should be "4"

@javascript
Scenario: User can not rate more than one time per recipe
  Given I am logged in as "rater@test.com"
  And  I am on the "Meatball-Stew" recipe show page
  And I click "4" on rating
  Then I should see the notice: "Thank you for your rating"
  And I should see "By 1 user"
  And I refresh the page
  And I should not see "Rate"

Scenario: Unauthenticated user tries to rate
  Given an unauthenticated user tries to rate "Meatball-Stew" with "3"
  Then I should see "You need to login first"
  And I should be on the login page

Scenario: Error handler kicks in when rating can not be saved
    Given I am logged in as "rater@test.com"
    And I submit an unsuccessful rating of "Meatball-Stew"
    Then I should see "An error occured"

