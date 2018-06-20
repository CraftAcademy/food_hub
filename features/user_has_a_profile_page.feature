Feature: Use has a profile page
  As a user
  In order to manage my account
  I would like to have a user profile page

Background:
  Given We have the following user:
      | email             |
      | maran@test.com |
      | author@test.com |

  And We have the following recipes:
      | title         | user           | forked from  |
      | Pizza         | maran@test.com |              |
      # | Forked Pizza  | maran@test.com | Pizza        |

  And I am logged in as "maran@test.com"

Scenario: User sees his email, own recipes and forked recipes on his profile page
  When I am on my profile page
  Then I should see "Email: maran@test.com"
  And I should see "Pizza" in "My Original Recipes" section
  # And I should see "Forked Pasta" in "My Forked Recipes" section
