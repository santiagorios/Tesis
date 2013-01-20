Feature: Manage Results
  In order to broadcast results
  As an author
  I want to create and manage results


  Scenario: Visit a project as a logged in user and owner of all the results
    Given the following user records
      | email              | password |
      | srrios@espe.edu.ec | secret   |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
      | Result 2 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 2 | false     |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the page for project "Project 1"
    Then I should see "Result 1"
    And I should see "Result 2"
    Then I should see "Project 1"

  Scenario: Create Result
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    Given the following result_type records
      | name           |
      | Result type 1 |
      | Result type 2 |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
      | Project 2 | Long text   | email: srrios@espe.edu.ec | title: Old   | false     |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the new "result" page
    And I fill in an element with id result_title with "New result"
    And I fill in the Description with "A long text"
    And I select "Result type 1" from "Result type"
    And I select "Project 1" from "Project"
    And I click the "Create Result" button
    Then I should see "New result"

  Scenario: Edit Result
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
      | Result 2 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 2 | false     |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the edit page of "Result 1" result
    And I fill in an element with id result_title with "New title"
    And I click the "Update Result" button
    Then I should see "New title"

  Scenario: Delete Result
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
    When I visit the page for result "Result 1"
    And I click the "Destroy" link
    Then I should see "There's nothing here yet"

  Scenario: Visit unpublished result as a logged in user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | false     |
    When I visit the page for result "Result 1"
    Then I should see "Result 1"

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


  Scenario: Visit a result as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | true      |
      | Result 2 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 2 | false     |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for result "Result 1"
    Then I should see "Result 1"

  Scenario: Visit an unpublished result as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following results exists:
      | title     | description | user                     | project          | result_type         | published |
      | Result 1 | Long text   | email: srrios@espe.edu.ec | title: Project 1 | name: Result type 1 | false     |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for result "Result 1"
    Then I should not see "Result 1"