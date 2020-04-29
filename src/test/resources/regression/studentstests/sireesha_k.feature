Feature: Login

  Scenario Outline: Verify valid super admin can login

    Given "<role>" is inlogin page
    When  he enters valid username and password
    And   enter username as"<username>"
    And   enter password as"<password>"
    And   submit the data
    Then  he should be able to navigate to AHS home page

    Examples:

      | role           | username | password |
      | Super admin    | sample   | 123456   |
      | Lab Technician | rajesh   | 123456   |
      | Lab Technician | rajesh   | 123456   |


  Scenario Outline: Verify  invalid super admin cannot login

    Given   super admin is in login page
    When    he enters invalid username and password
    And     enter username as  invalid"<username>"
    And     enter password as invalid "<password>"
    And     submit the data
    Then    he should get the error as "<Error messaage>"

    Examples:

      | username | password | Error messaage                     |
      | deepika  | 3456789  | invalid credentials                |
      | deepika  |          | Please enter password              |
      |          | 3456789  | Please enter username              |
      |          |          | Please enter password and username |

