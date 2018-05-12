Feature: User can comment on a recipe
  As a user
  in order to express my opinion
  I would like to comment on recipes

Background:
  Given We have the following list:
    | title       	| description                 | ingredients        | directions              |
    | Meatball-Stew | This will make you sick     | Meat, onion, stuff | Stir it, mix it, eat it |

  Given We have the following user:
    | email           | password    |
    | maran@test.com  | 12345678    |

Scenario: User comments on a recipe
  Given I visit the site
  And I am logged in as "maran@test.com"
  When I click "Meatball-Stew"
  And I fill in "Body" with "I got sick, how do i sue you?"
  And I click "Create Comment"
  Then I should see "Thank you for your feedback"
  And I should see "I got sick, how do i sue you?"
  And I should see "Written by maran@test.com"
