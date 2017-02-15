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
    
    
  Scenario: Scenario 4 Enabling/Disabling Call Waiting
    Given I am a registered user
    And I click My Settings link
    And I check call_waiting_option checkbox
		Then I will see Success Notification popup
    
    
  Scenario: Scenario 5 Enabling/Disabling Voicemail
    Given I am a registered user
    And I click My Settings link
    And I check voicemail_option checkbox
		Then I will see Success Notification popup
    
    
  Scenario: Scenario 6 Enabling/Disabling Usage Alerts
    Given I am a registered user
    And I click My Settings link
    And I check usage_alerts_option checkbox
		Then I will see Confirmation popup
    When I click confirmation_option
    Then I will see Success Notification popup
    
    
  Scenario: Scenario 7 Enabling/Disabling International Roaming
    Given I am a registered user
    And I click My Settings link
		And I check international_roaming_option checkbox
		Then I will see Confirmation popup
    When I click confirmation_option
    And I will see Success Notification popup
    
  
  Scenario: Scenario 8 Updating Call Forwarding
    Given I am a registered user
    And I click My Settings link
    When I click call_forwarding Edit link
		And I enter new call_forwarding number
    And I click Save button
		Then I will see Success Notification popup  
  