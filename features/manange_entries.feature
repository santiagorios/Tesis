@focus
Feature: Manage Entries
  In order to broadcast entries
  As an author
  I want to create and manage entries


  Scenario: Visit a entries list as a logged in user and owner of all the entries
    Given the following user records
      | email              | password |
      | srrios@espe.edu.ec | secret   |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
      | Entry 2 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit list of myentries
    Then I should see "Entry 1"
    And I should see "Entry 2"

  Scenario: Create Entry
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the new "entry" page
    And I fill in an element with id entry_title with "New entry"
    And I fill in the Body with "A long text"
    And I select "Program 1" from "Program"
    And I click the "Create Entry" button
    Then I should see "New entry"

  Scenario: Edit Entry
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
      | Entry 2 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the edit page of "Entry 1" entry
    And I fill in an element with id entry_title with "New title"
    And I click the "Update Entry" button
    Then I should see "New title"

  Scenario: Delete Result
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
    When I visit the page for entry "Entry 1"
    And I click the "Destroy" link
    Then I should see "There's nothing here yet"

  Scenario: Visit unpublished entry as a logged in user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
    When I visit the page for entry "Entry 1"
    Then I should see "Entry 1"

  Scenario: Visit an entry as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | New       | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
      | Entry 2 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    And I am an anonymous user
    When I visit list of entries
    Then I should see "Entry 1"
    And I should not see "Entry 2"


  Scenario: Create an entry as an anonymous user
    Given I am an anonymous user
    When I visit the new "entry" page
    Then I should see "Please sign in"

  Scenario: Edit an entry as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
      | Entry 2 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    When I visit the edit page of "Entry 1" entry
    Then I should see "Please sign in"


  Scenario: Delete an entry as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
      | Entry 2 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    When I visit the page for entry "Entry 1"
    Then I should not see "Destroy"


  Scenario: Visit an unpublised entry as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    When I visit the page for entry "Entry 1"
    Then I should not see "Entry 1"
    And I should see "Please sign in"

  Scenario: Visit an entry as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | New       | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
      | Entry 2 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    And I am an anonymous user
    When I visit the page for entry "Entry 1"
    Then I should see "Entry 1"


  Scenario: Visit an entry as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | true      |
      | Entry 2 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for entry "Entry 1"
    Then I should see "Entry 1"

  Scenario: Visit an unpublished entry as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following entries exists:
      | title   | body        | user                      | program          | published |
      | Entry 1 | Long text   | email: srrios@espe.edu.ec | title: Program 1 | false     |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for entry "Entry 1"
    Then I should not see "Entry 1"