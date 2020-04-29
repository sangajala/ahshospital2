Feature:  Assign Group Test

  Scenario Outline: Verify super admin can create Assign Group Test.
    Given Super admin logged in
    And Navigated to Masters page
    And Navigated to Assign Group Test
    When opens the Add Assign Group Test
    And set Group test as "<Group test>" Main test as "<Main test>" Sub test as "<Sub test>"
    And Submits the data to create Assign Group Test
    Then should be navigating to list of Assign Group Test

    Examples:
      | Group test | Main test | Sub test        |
      | Haemogram  | URINE     | RBC Count       |
      | Haemogram  | URINE     | Total WBC Count |


  Scenario Outline: Verify super admin can create Assign Group Test without valid information.
    Given Super admin logged in
    And Navigated to Masters page
    And Navigated to Assign Group Test
    When opens the Add Assign Group Test
    And set Group test as "<Group test>" Main test as "<Main test>" Sub test as "<Sub test>"
    And Submits the data to create Assign Group Test
    Then should be giving error message saying to give data

    Examples:
      | Group test | Main test | Sub test | Error                             |
      | <blank>    | <blank>   | <blank>  | Please select an item in the list |
      | Haemogram  | <blank>   | <blank>  | Please select an item in the list |
      | Haemogram  | URINE     | <blank>  | Please select an item in the list |


  Scenario Outline: Verify super admin can search from Assign Group Test list.
    Given Super admin logged in
    And Navigated to Masters page
    And Navigated to Assign Group Test
    When search name or number "<phrase>"  is entered
    Then results for name or number "<phrase>" are shown
    And the related results include "<related>"
    Examples:

      | phrase | related |
      | Urea   | Urea    |
      | 999    | 999     |

  Scenario Outline: Verify super admin can delete from Assign Group Test list.
    Given Super admin logged in
    And Navigated to Masters page
    And Navigated to Assign Group Test
    When search name or number "<phrase>"  is entered
    Then user should see the results
    When delete button pressing
    When search name or number "<phrase>"  is entered
    Then user should NOT see the results
    Examples:

      | phrase |
      | Urea   |
      | 999    |

  Scenario: Verify super admin can perform action active & inactive from Assign Group Test.
    Given Super admin logged in
    And Navigated to Masters page
    And Navigated to Assign Group Test
    When search name or number "Urea" is entered
    Then user should see the results
    When selects on the Action button
    And selects Inactive button
    Then should the status of first result should be inactive
    When selects on the Action button
    And selects active button
    Then should the status of first result should be active