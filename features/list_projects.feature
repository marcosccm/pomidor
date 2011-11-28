Feature: List the Projects
  In order to track my work 
  As a developer
  I want to see a list of my projects

  Scenario: List Multiple Projects
    Given the following projects
      | name   |
      | mimir  |
      | bragi  |
    When  I run `pomidor project list`
    Then  the output should contain: 
      """
      1 - mimir
      2 - bragi
      """
