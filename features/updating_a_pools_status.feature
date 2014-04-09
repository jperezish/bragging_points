Feature: Updating the status of a pool

  Scenario: Activating a pool
    Given a pool that has not started
    When I update the pools status to active
    Then I should see that the pool is active

  Scenario: Completing a pool
    Given a pool that is active
    When I update the pools status to complete
    Then I should see that the pool is complete