Feature: Manage Settings

  Scenario Outline: Scenario 1 Updating SIM Nickname
    Given I am a registered user
    And I click My Settings link
		When I edit Nickname
    And I enter New Nickname
    When I click <save_cancel> button
		Then I will <see_not_see> New Nickname
    
    Examples:
    | save_cancel | see_not_see |
    | Cancel      | not see     |
    | Save        | see         |
 
  
  Scenario Outline: Scenario 2 Updating Recharge PIN
    Given I am a registered user
    And I click My Settings link
  	When I edit Recharge PIN
    And I enter New Recharge PIN
    And I <accept_cancel> the updates
		Then the New Recharge PIN will <display_not_display>

    Examples:
    | accept_cancel | display_not_display |
    | Cancel        | not display     |
    | Save          | display         |
  
  
  Scenario: Scenario 3 Enabling/Disabling Caller ID
    Given I am a registered user
    And I click My Settings link
    And I check caller_id_option checkbox
		Then I will see Success Notification popup
  