Feature: Manage Availabilty
  In order to track user availabilty
  As an user
  I want to set and manage availabilty

  Scenario: Show User Availabilty
    Given a user with name Paul
    And user has no availabilty set
    When I request "Paul"'s schedule
    Then I should see "User has no availability"

  Scenario: Show User Availabilty
    Given a user with name Paul
    And user is available from "September 1 10:00" to "September 1 11:00"
    When I request "Paul"'s schedule
    Then I should see "September 1 10:00 - September 1 11:00"
