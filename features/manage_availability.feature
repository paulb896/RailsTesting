Feature: Manage Availabilty
  In order to track user availabilty
  As an user
  I want to set and manage availabilty

  Scenario: Show User Availabilty
    Given a user with name Paul
    And "Paul" has no availabilty set
    When I request "Paul"'s schedule
    Then I should see "User has no availability"

  Scenario: Show User Availabilty
    Given a user with name Paul
    And "Paul" is available from "1/Nov/2012 16:19:30" to "1/Nov/2012 16:29:30"
    When I request "Paul"'s schedule
    Then I should see "2012-11-01 16:19:30"
    And I should see "2012-11-01 16:29:30"
