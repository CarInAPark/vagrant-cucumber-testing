Feature: UI
  Test UI

Scenario: Check that UI is working
        Given I am on "https://localhost:4443/app"
        When I click the "Enter" button
        Then the page loads   