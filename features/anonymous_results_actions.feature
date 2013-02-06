Feature: Anonymous actions for results
  In order to broadcast results
  As an anonymous user
  I want to access results as long as some conditions are met

  Scenario: Visit a project as an anonymous user
    Given the following program_type records
      | name           |
      | program type 1 |
      | program type 2 |
    And the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | New       | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
      | Result 2 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 2 | false     |
    And I am an anonymous user
    When I visit the page for project "Project 1"
    Then I should see "Result 1"
    And I should not see "Result 2"
    Then I should see "Project 1"


  Scenario: Create a result as an anonymous user
    Given I am an anonymous user
    When I visit the new "result" page
    Then I should see "Please sign in"

  Scenario: Edit a result as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
      | Result 2 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 2 | false     |
    When I visit the edit page of "Result 1" result
    Then I should see "Please sign in"


  Scenario: Delete a result as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
      | Result 2 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 2 | false     |
    When I visit the page for result "Result 1"
    Then I should not see "Destroy"


  Scenario: Visit an unpublised result as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | false      |
    When I visit the page for project "Project 1"
    Then I should not see "Project 1"
    And I should see "Please sign in"

  Scenario: Visit a result as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | New       | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
      | Result 2 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 2 | false     |
    And I am an anonymous user
    When I visit the page for result "Result 1"
    Then I should see "Result 1"