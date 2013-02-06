Feature: Anonymous actions for projects
  In order to broadcast projects
  As an anonymous user
  I want to access projects as long as some conditions are met

  Scenario: Project list as anonymous user
    Given the following program_type records
      | name           |
      | program type 1 |
      | program type 2 |
    And the following user records
      | email              | password |
      | srrios@espe.edu.ec | secret   |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | New       | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
      | Old       | Long text   | email: srrios@espe.edu.ec | name: program type 2 | false     |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
      | Project 2 | Long text   | email: srrios@espe.edu.ec | title: Old   | false     |
    When I visit list of projects
    Then I should see "Project 1"
    And I should not see "Project 2"


  Scenario: Create a project as an anonymous user
    Given I am an anonymous user
    When I visit the new "project" page
    Then I should see "Please sign in"

  Scenario: Edit project as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
      | Project 2 | Long text   | email: srrios@espe.edu.ec | title: Old   | false     |
    When I visit the edit page of "Project 1" project
    Then I should see "Please sign in"


  Scenario: Delete project as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am an anonymous user
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
      | Project 2 | Long text   | email: srrios@espe.edu.ec | title: Old   | false     |
    When I visit the page for project "Project 1"
    Then I should not see "Destroy"


  Scenario: Visit unpublished project as an anonymous user
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

  Scenario: Visit a project as an anonymous user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And the following programs exists:
      | title     | description | user                      | program_type         | published |
      | New       | Long text   | email: srrios@espe.edu.ec | name: program type 1 | true      |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
    And I am an anonymous user
    When I visit the page for project "Project 1"
    Then I should see "Project 1"