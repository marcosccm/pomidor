Feature: Create a Project
  In order to track my work 
  As a developer
  I want to create projects

  Scenario: Create a New Project
    When I run `pomidor project create \"pomidor\"`
    Then the exit status should be 0
    And there should be a project called "pomidor"
    And  there should be 1 projects

  Scenario: Create Multiple Projects
    When I run `pomidor project create \"attack of the pomidor\"`
    When I run `pomidor project create \"revenge of the pomidor\"`
    Then there should be a project called "attack of the pomidor"
    And  there should be a project called "revenge of the pomidor"
    And  there should be 2 projects
