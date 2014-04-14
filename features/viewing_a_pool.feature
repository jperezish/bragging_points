Feature: Viewing a pool

  Scenario: No pools running today
    Given there are no pools running today
    When I go to the pools listing page
    Then I should see that there are no pools running

  Scenario: Some pools are running today
    Given there are some pools
    When I go to the pools listing page
    Then I should see some pools

  Scenario: Viewing the details of a pool
    Given there are some pools
    When I go to the pools listing page
    And I select a pool
    Then I should see the pools detail page

  Scenario: Viewing a pool with 0 bragging points
    Given a pool with 0 bragging points
    When I go to the pools listing page
    And I select a pool
    Then I should see that there are no bragging points