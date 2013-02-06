Feature: Anonymous actions for entries
  In order to broadcast entries
  As an anonymous user
  I want to access entries as long as some conditions are met

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