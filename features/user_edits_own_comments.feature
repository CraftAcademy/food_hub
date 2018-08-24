Feature: User edits their own comments
  As a user
  in order to update my comments
  I would like to be able to edit my comment

Background:
  Given We have the following user:
    | email          | password |
    | maran@test.com | 12345678 |

  Given We have the following recipes:
    | title       	|
    | Meatball-Stew |

  Given We have the following comment:
    | comment    	                  |
    | I got sick, how do i sue you? |

  And I am logged in as "maran@test.com"
  And I visit the site

Scenario: User edits their own comments
  Given I click "Meatball-Stew"
  When I click "Edit Comment"
  And I fill in "Body" with "I got sick, how do i sue you?"
  And I click "Save Comment"
  Then I should see "You have successfully edit comment!"
