Feature: User can search for recipes
    As a user
    In order to find a specific recipe
    I need to be able to search for recipes

    Background:
        Given We have the following user:
            | email             | role |
            | user_1@random.com | user |

        And We have the following recipes:
            | title         | user              |
            | Meatball-Stew | user_1@random.com |
            | Meatballs     | user_1@random.com |
            | Pizza         | user_1@random.com |

    Scenario: User searches for "Meatball" and gets 2 hits
        Given I visit the site
        And I fill in "Search" with "Meatball"
        And I click "Search"
        Then I should see "Found 2 recipes"
        And I should see "Meatball-Stew"
        And I should see "Meatballs"
        And I should not see "Pizza"

