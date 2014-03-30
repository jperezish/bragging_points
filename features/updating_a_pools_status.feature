Feature: Updating the status of a pool

  Scenario: Activating a pool
    Given a pool that has not started
    When I go to the pool
    And I go to the running pools display page
    Then I should see that the pool is active