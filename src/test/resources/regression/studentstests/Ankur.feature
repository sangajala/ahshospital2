Feature: User Details

  Scenario: Verify all the users details appear on screen
    Given Superadmin logged in
    And He navigate onto Masters screen
    When He select "Users" from submenu
    Then All the registered user details displaying on screen

  Scenario:Verify only No unauthorised person can have access to Masters.
    Given Log in as a user "07442382354"
    Given Password "Rakesh123"
    When user "07442382354" logged in.
    Then He can not see the Masters screens on his display.

  Scenario Outline: Verify user details screen showing User Name,Password,Email and mobile number of user.
    Given Superadmin logged in
    And He navigate to Masters screen
    When He select user details menu
    Then He shows User name as "<user name>",Password as "<password">,Email as "<email>"and mobile number as<"Mobile number">of the user

    Examples:

      | User Name | Password | Email | Mobile number |
      | Value     | Value    | Value | Value         |


  Scenario Outline: Verify Superadmin can add new user details
    Given Superamin looged in
    And He navigate to Masters screen
    And He select User Details menu
    And He select Add New user
    When He enter user name as "<user name>"and user type as<"superadmin">and mobile number as"<mobile number>"and Action as"<Edit>"
    Then He should be navigate to list of new user
    And The new "<user name>" should be available in the field

    Examples:

      | User Name | Password | Email | Mobile number | Action |
      | Value     | Value    | Value | Value         |        |


#  Scenario Outline: Verify Superadmin can Edit user details
#    Given Superamin looged in
#    And He navigate to Masters screen
#    And He select User Details menu
#    And He select Edit
#    And Selected user details with user name as "<user name>" and Mobile number as "<Mobile number>"and password as "<password>"and branch name as"<branch name>" appeared.
#    When He updates details and select submit.
#    Then All the updated data should be available for the secleted user
#
#
#  e.g. Name			Alphabet
#  Mobile number  Numbers
#  Password		Value
#  User Type		Various
#  Branch Name 	Various

  Scenario Outline: Verify Superadmin can not be able to Submit the Edited data without mandatory entry of all the fields.

    Given Superamin looged in
    And He navigate to Masters screen
    And He select User Details menu
    And He select Edit
    And Selected user details with user name as "<user name>" and Mobile number as "<Mobile number>"and password as "<password>"and branch name as"<branch name>" appeared.
    When He updates details user name as "<user name>" and Mobile number as "<empty>"and password as "<password>" and branch name as "<branch name>"
    And Select Submit
    Then Error message should be appear as "Please enter the required data"

    Examples:
      | User Name | Password | Email | Mobile number | Action |
      | Value     | Value    | Value | Value         |        |