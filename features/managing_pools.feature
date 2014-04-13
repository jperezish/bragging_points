Feature: Managing Pools

  Scenario: Creating a new pool
    When I choose to create a new pool
    And I enter the required information
    Then I should see the pool on the pool detail page

  Scenario: Editing an existing pool
    When I view the details of an existing pool
    And I choose to edit an existing pool
    And I enter some updated information
    Then I should see the pool on the pool detail page


  Scenario: Deleting an existing pool
    When I view the details of an existing pool
    And I choose to delete an existing pool
    Then I should not see the pool on pool index page