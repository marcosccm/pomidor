Feature: List the Projects
  In order to track my work 
  As a developer
  I want to see a list of my projects

  Scenario: List a Single Project
    Given a project called "attack of the pomidor"
    When  I run `pomidor project list`
    Then  the output should contain "attack of the pomidor"
