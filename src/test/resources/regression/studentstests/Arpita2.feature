Feature: Group test

  Scenario Outline: Verify super admin can create group test
    Given Super admin logged in
    And he navigated to group test page
    When he opens the add group test page
    And enter group test name as "<group test name>" and price as "<price>"

  Examples:
  |Group test name|Price|
  |Sample test|10|


    And submit the data as create new group
    Then he should be navigated to list of group test page
    And the "<group test name>" should be available in the list
    And the "<price>" should match

  Scenario Outline: Verify super admin cannot create group test without valid information
    Given Super admin logged in
    And he navigated to group test page
    When he opens the add group test page
    And enter group test name as "<group test name>" and price as "<price>"

  Examples:
  |Group test name|Price|
  |Sample test||
    And submit data as create new group
    Then he should be navigated to list of group test page
    And created new group test name will not appear

  Scenario Outline: Verify super admin can search the group test in the group test list
    Given Super admin logged in
    And he navigated to group test page
    When he enters the group test name is search box
    And enter group test name as "<group test name>"

  Examples:
  |Group test name
  |Sample test
    Then the group test name list should appear

  Scenario: Verify super admin can delete the group test sucessfully
    Given Super admin logged in
    And he navigated to group test page
    When he selects delete in action tab
    Then group test will be deleted sucessfully

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

     
     
     
     
     
     

     
     
  
