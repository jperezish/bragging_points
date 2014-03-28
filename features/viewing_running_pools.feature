Feature: Viewing the pools running today

  Scenario: No pools running today
    Given there are no pools running today
    When I go to the running pools display page
    Then I should see that there are no pools running

  Scenario: Some pools are running today
    Given there are some pools running today
    When I go to the running pools display page
    Then I should see the running pools grouped by status