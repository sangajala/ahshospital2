Feature: Group test

  Scenario Outline: Verify super admin can create group test
    Given Super admin logged in
    And he navigated to group test page
    When he opens the add group test page
    And enter group test name as "<Group test name>" and price as "<Price>"
    And submit the data as create new group
    Then he should be navigated to list of group test page
    And the "<Group test name>" should be available in the list
    And the "<Price>" should match

    Examples:
      | Group test name | Price |
      | Sample test     | 10    |

  Scenario Outline: Verify super admin cannot create group test without valid information
    Given Super admin logged in
    And he navigated to group test page
    When he opens the add group test page
    And enter group test name as "<Group test name>" and price as "<Price>"
    And submit data as create new group
    Then he should be see an "Please select valid value"

    Examples:
      | Group test name | Price |
      | Sample test     |       |
      |                 | 0     |

  Scenario Outline: Verify super admin can search the group test in the group test list
    Given Super admin logged in
    And he navigated to group test page
    When he enters the group test name is search box
    And enter group test name as "<Group test name>"
    Then the group test name list should appear

    Examples:
      | Group test name |
      | Sample test     |
      | Sample          |
      | test            |
      | Sam             |


  Scenario: Verify super admin can delete the group test sucessfully
    Given Super admin logged in
    And he navigated to group test page
    When he search for "ABC"
    And delete first record
    When he search for "ABC"
    Then no results should be found

  Scenario: Verify super admin can change the status of the group test
    Given Super admin logged in
    And he navigated to group test page
    When he selects drop down menu in action tab
    And he get option as active or inactive status
    Then selected group test status will be changed

  Scenario: Verify group test created are available while registering a diagonstic test
    Given Super admin logged in
    And he navigated to group test page
    When he opens the registration page
    And he get the option of group test on select tests
    Then he can select the available  group test created

  Scenario: Verify group test created are available while assign group test
    Given Super admin logged in
    And he navigated to group test page
    When he selects assign group test
    And he navigates to assign group test page
    Then he can select the available group test created

  Scenario: Verify if the super admin wants to inactive the group test or special package test then it will be invisisble in the registration screen
    Given Super admin logged in
    And he navigated to group test page
    When he selects drop down menu in action tab
    And he selects inactive status
    And he navigates to registration page
    And he opens the registration page
    And he selects the group test list
    Then he cannot see the inactive group test name











