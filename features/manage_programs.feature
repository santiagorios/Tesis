Feature: Manage Programs
  In order to broadcast programs
  As an author
  I want to create and manage programs

  Scenario: Programs List as logged in user and owner of all the programs
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
      | Program 2 | Long text   | email: srrios@espe.edu.ec | name: program type 2 | false     |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit profile for "srrios@espe.edu.ec"
    Then I should see "Program 1"
    And I should see "Program 2"

  Scenario: Create Program
    Given the following program_type records
      | name           |
      | program type 1 |
      | program type 2 |
    And the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the new "program" page
    And I fill in the Title with "New title"
    And I fill in the Description with "A long text"
    And I select "program type 1" from "Program type"
    And I click the "Create Program" button
    Then I should see "New title"

  Scenario: Edit Program
    Given the following program_type records
      | name           |
      | program type 1 |
      | program type 2 |
    And the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    When I visit the edit page of "Program 1" program
    And I fill in the Title with "New title"
    And I click the "Update Program" button
    Then I should see "New title"

  Scenario: Delete Program
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    When I visit the page for program "Program 1"
    And I click the "Destroy" link
    Then I should see "There's nothing here yet"

  Scenario: Visit unpublished program as a logged in user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | false     |
    When I visit the page for program "Program 1"
    Then I should see "Program 1"

  Scenario: Visit a program as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for program "Program 1"
    Then I should see "Program 1"

  Scenario: Visit a unpublished program as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | Program 1 | Long text   | email: srrios@espe.edu.ec | name: program type 1 | false      |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for program "Program 1"
    Then I should not see "Program 1"