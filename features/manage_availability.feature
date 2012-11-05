Feature: Manage Availabilty
  In order to track user availabilty
  As an user
  I want to set and manage availabilty

  Scenario: Show User Availabilty
    Given a user with name Paul
    When I request a user schedule
    Then I should see "a listing of user availabilty"
