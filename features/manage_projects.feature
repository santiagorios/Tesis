Feature: Manage Projects
  In order to broadcast projects
  As an author
  I want to create and manage projects

  Scenario: Visit my profile as a logged in user and owner of all the projects
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
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit profile for "srrios@espe.edu.ec"
    Then I should see "New"
    And I should see "Old"
    Then I should see "Project 1"
    And I should see "Project 2"

  Scenario: Create Project
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
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the new "project" page
    And I fill in the Title with "New project"
    And I fill in the Description with "A long text"
    And I select "New" from "Program"
    And I click the "Create Project" button
    Then I should see "New project"

  Scenario: Edit Project
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
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    When I visit the edit page of "Project 1" project
    And I fill in the Title with "New title"
    And I click the "Update Project" button
    Then I should see "New title"

  Scenario: Delete Project
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
    When I visit the page for project "Project 1"
    And I click the "Destroy" link
    Then I should see "There's nothing here yet"

  Scenario: Visit unpublished project as a logged in user
    Given the following user records
      | email              | password | activation_state |
      | srrios@espe.edu.ec | secret   | active           |
    And I am logged in as "srrios@espe.edu.ec" with password "secret"
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | false     |
    When I visit the page for project "Project 1"
    Then I should see "Project 1"


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

  Scenario: Visit a project as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | true      |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for project "Project 1"
    Then I should see "Project 1"

  Scenario: Visit a unpublished project as a logged in user but not owner
    Given the following user records
      | email              | password | activation_state |
      | test@espe.edu.ec   | secret   | active           |
      | srrios@espe.edu.ec | secret   | active           |
    And the following projects exists:
      | title     | description | user                      | program      | published |
      | Project 1 | Long text   | email: srrios@espe.edu.ec | title: New   | false      |
    And I am logged in as "test@espe.edu.ec" with password "secret"
    When I visit the page for project "Project 1"
    Then I should not see "Project 1"