Feature: Authorization
  As a user
  I want to use my credentials to login the system
  So I can login the system

  Scenario: user can authorize on website with correct credentials
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I fill email and password field
    And I click Login button on Login page
    Then I get to user home page and then logout

  Scenario: user can authorize on website with correct credentials
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I fill email and password field
    And I click Remember me button on Login page
    And I click Login button on Login page
    Then I get to user home page

  Scenario: being remembered user can open home page without credentials
    Given home page of web application
    Then I get to user home page and then logout

  Scenario: after logout user can not open home page without credentials
    Given home page of web application
    Then I can not get to user home page

@negative_steps
  Scenario: user can not authorize on website without password
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I fill email field
    And I click Login button on Login page
    Then I get an error of incorrect email or password

@negative_steps
  Scenario: user can not authorize on website without email
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I fill password field
    And I click Login button on Login page
    Then I get an error of incorrect email or password

@negative_steps
  Scenario: user can not authorize on website without email and password
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I click Login button on Login page
    Then I get an error of incorrect email or password

@negative_steps
  Scenario: user can not authorize on website with incorrect email
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I fill incorrect email field
    And I fill password field
    And I click Login button on Login page
    Then I get an error of incorrect email or password

@negative_steps
  Scenario: user can not authorize on website with incorrect password
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I fill email field
    And I fill incorrect password field
    And I click Login button on Login page
    Then I get an error of incorrect email or password

@negative_steps
  Scenario: user can not authorize on website with incorrect password and email
    Given home page of web application
    When I click Log In menu item on home page
    Then I get to login page
    When I fill incorrect email field
    And I fill incorrect password field
    And I click Login button on Login page
    Then I get an error of incorrect email or password
