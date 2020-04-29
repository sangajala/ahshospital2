Feature: Appointment Details

  Scenario Outline: Check all appointment displays on appointment details page
    Given User logged in to the URL
    And Navigates to the Registration Page
    When User select to create a the New User
    And creates appointment with Fill Name as "<Name>" and Age as "<Age>" and Select Gender as "<Select Gender>" and Ref. Doctor as "<Ref. Doctor>" and App Date as "<App Date>" and Time as "<Time>" and Select Branch as "<Branch>"and Enter Address as "<Address>" Total Amount as "<Total Amount>"
    Then User goes to the appointment details page
    When he search for "<Name>"
    And the created appointment should be visible
    And Appointment should have status "Pending" under entries list

    Examples:

      | Name         | Age | Select Gender | Ref. Doctor | App Date   | Time  | Branch          | Address | Total Amount |
      | Ankit - Test | 38  | Male          | John Smith  | 20/01/2020 | 10:00 | Vishakapattanam | London  | 100          |


  Scenario: Check the entered appointment can be deleted

    Given atleast one appointment exist in the list of appointments
    When selects on first appointment
    When User click on to edit button
    When User click on to the delete button
    Then the selected entry should be deleted

  Scenario: Check the entered appointment can be cacncelled
    Given User click on to the created appointment
    When User click on to edit button
    When User click on to the cancel button
    Then Selected entry should be cancelled

  Scenario Outline: Search box performs with alphabetical characters
    Given Search box on to Appointment Details Page
    When Search phrase "<Key>" is entered
    Then Appropriate results for "<Key>" is available

    Examples:
      | Key |
      | ABC |
      | 123 |


  Scenario: Search box should not perform with special characters
    Given Search box on to Appointment Details Page
    When Search phrase "!" and "%" and "&" and "@" and "/" is entered
    Then Any entries should not be available

  Scenario: Search box should not perform with alphanumeric combination
    Given Search box on to Appointment Details Page
    When Search phrase "Test123" is entered
    Then Any entries should not be availble

  Scenario: Checking ascending and descending orders of the entries
    Given Entries available on to the list
    When click on the up arrow on "ID" column
    Then the first record should be "1"
    When click on the down arrow on "ID" column
    Then the first record should be "10"
    When click on the up arrow on "Name" column
    Then the first record should be "ABC"
    When click on the down arrow on "Name" column
    Then the first record should be "XYZ"
    When click on the up arrow on "Mobile Number" column
    Then the first record should be "10"
    When click on the down arrow on "Mobile Number" column
    When click on the up arrow on "Status" column
    When click on the down arrow on "Status" column
    Then the first record should be "Active"

  Scenario: Checking functionality of Entries box
    Given Number of entries available on to appointment details page
    When Select a number between "1" to "99"to show per page
    When Select the next page of entries
    Then Number of entries should be displayed
    Then User can see the number of entries showing of total entries available
    Then User should land on to the correct page

  Scenario: Click boxes on top right of the Appointment Details Page
    Given Print Excel and PDF buttons available for user
    When Select "Print" button
    Then Available entries go to the print command
    When Select "Excel" button
    Then Available entries open with excel sheet
    When Select "PDF" button
    Then Available entries export into PDF format
