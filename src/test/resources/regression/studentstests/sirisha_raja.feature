Feature:  Reports

  Scenario Outline: Verify super admin can search the Reports.
    Given     super admin logged in
    And       navigated to reports page
    When search name or number "<phrase>"  is entered
    Then results for name or number "<phrase>" are shown
    And the related results include "<phrase>"
    Examples:

      | phrase |
      | Devi   |
      | 234    |


  Scenario Outline: verify super admin can range the Dates.
    Given      superadmin logged in
    And        Navigated to the reports page.
    When       search range of the dates from date1 "<fromdate>" to date2 "<todate>"is entered.
    Then       atleast 1 record is shown

    Examples:

      | fromdate  | todate     |
      | 1/1/2020  | 15/1/2020  |
      | 7/12/2019 | 28/12/2019 |




