Feature: Log in
  As a user
  I want to use Login button to get to the login page
  So I can have ability to login the system

  Scenario: user can open login page via menu
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
