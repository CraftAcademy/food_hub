Feature: User can rate recipes
  As a user
  In order to evaluate recipes
  I would like to be able to rate recipes

Background:
  Given We have the following user:
    | email           | password    |
    | maran@test.com  | 12345678    |

  Given We have the following recipes:
    | title       	| user            |
    | Meatball-Stew | maran@test.com  |

  And I am logged in as "rater@test.com"

@javascript
Scenario: User can rate a recipe when visiting the recipe page
  Given I visit the site
  And I click "Meatball-Stew"
  And I click "4" on rating
  Then I should see the notice: "Thank you for your rating"
  And the average rating for "Meatball-Stew" should be "4"

@javascript
Scenario: User can not rate more than one time per recipe
  Given I visit the site
  And I click "Meatball-Stew"
  And I click "4" on rating
  Then I should see the notice: "Thank you for your rating"
  And I refresh the page
  And I should not see "Rate"
