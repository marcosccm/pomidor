Feature: Create Tasks
  In order to divide my work 
  As a developer
  I want to create a task under a project

  Background:
    Given the following projects
      | name   |
      | mimir  |

  Scenario: Create a task
    When I run `pomidor task create \"add a feature"`
    Then the exit status should be 0
    And there should be a task called "add a feature" under the project "mimir"
