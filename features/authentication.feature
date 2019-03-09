Feature: Authentication
  As a user
  I want to use my credentials to signed in the system
  So I can signed in the system

  Scenario: user can open login page via menu
    Given home page of web application
    When click Log In menu item on home page
    Then is on login page

  Scenario: user can sign in to website with correct credentials
    Given the user is signed in
    And is on the home page

  Scenario: user can sign in to website and credentials will be remembered
    Given the user is signed in and remembered
    And is on the home page

  Scenario: being remembered user can open home page without credentials
    Given home page of web application
    And is already signed in

  Scenario: after logout user can not see home page
    Given reset browser session
    When navigate to home page
    Then is unauthenticated at home page

  Scenario: user can not sign in to website without password
    Given login page with empty password
    And try to login
    Then get an error of incorrect email or password

  Scenario: user can not sign in to website without email
    Given login page with empty email
    And try to login
    Then get an error of incorrect email or password

  Scenario: user can not sign in to website without email and password
    Given login page with empty email and password
    And try to login
    Then get an error of incorrect email or password

  Scenario: user can not sign in to website with incorrect email
    Given login page with incorrect email
    And try to login
    Then get an error of incorrect email or password

  Scenario: user can not sign in to website with incorrect password
    Given login page with incorrect password
    And try to login
    Then get an error of incorrect email or password

  Scenario: user can not sign in to website with incorrect password and email
    Given login page with incorrect password and email
    And try to login
    Then get an error of incorrect email or password
