Feature: Anonymous actions for programs
  In order to broadcast programs
  As an anonymous user
  I want to access programs as long as some conditions are met

  Scenario: Programs List as anonymous user
    Given the following program_type records
      | name           |
      | program type 1 |
      | program type 2 |
    And the following user records
      | email              | password |
      | srrios@espe.edu.ec | secret   |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
      | Program 2| Long text   | email: srrios@espe.edu.ec | name: program type 2 | false     |
    When I visit list of programs
    Then I should see "Program 1"
    And I should not see "Program 2"


  Scenario: Create a program as an anonymous user
    Given I am an anonymous user
    When I visit the new "program" page
    Then I should see "Please sign in"

  Scenario: Edit Program as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    When I visit the edit page of "Program 1" program
    Then I should see "Please sign in"


  Scenario: Delete Program as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    When I visit the page for program "Program 1"
    Then I should not see "Destroy"


  Scenario: Visit unpublished program as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | false     |
    When I visit the page for program "Program 1"
    Then I should not see "New"

  Scenario: Visit a program as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And I am an anonymous user
    When I visit the page for program "Program 1"
    Then I should see "Program 1"