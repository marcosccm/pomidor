Feature: Set the current project
  In order to track my work 
  As a developer
  I want to set the current working project

  Scenario: Default Current is the Last Created Project
    Given the following projects
      | name   |
      | mimir  |
      | iris   | 
      | bragi  | 
    When I run `pomidor project current`
    Then the output should contain "bragi" 
    And  the output should not contain "mimir"
    And  the output should not contain "iris"

  Scenario: Set the default
    Given the following projects
      | name   |
      | mimir  |
      | iris   | 
      | bragi  | 
    When I run `pomidor project current 1`
    When I run `pomidor project current`
    Then the output should contain "mimir" 
