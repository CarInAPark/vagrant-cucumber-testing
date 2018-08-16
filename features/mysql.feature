Feature: localhost
  database should be set up

  Scenario: check tables present
    Given I ssh to vagrantbox "default"
    When I have a MySQL server on localhost
    Then it should have more than 1 databases
    And it should have more than 1 tables in database 'X'
    And table 'Y' in database 'X' should have at least 1 items
    And it should clean up