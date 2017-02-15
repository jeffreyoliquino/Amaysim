Given /^I am a registered user$/ do 
visit('')
click_link('Login')
find('input#mobile_number').set($BASE_CONFIG["username"])
find('input#password').set($BASE_CONFIG["password"])
click_button('Login')
#wait_until
sleep(20)
expect(page).to have_css('div#welcome_popup')
find('div#welcome_popup a.close-reveal-modal').click
end

And /^I click My Settings link$/ do
find("a[href='/my-account/my-amaysim/settings']").click
sleep(10)
end

When /^I edit Nickname$/ do 
find('a#edit_settings_phone_label').click
sleep(10)
end

And /^I enter New Nickname$/ do
find('input#my_amaysim2_setting_phone_label').set($BASE_CONFIG["nickname"])
end

When /^I click ([^"]*) button$/ do |save_cancel|
  if save_cancel == "Cancel"
    find('a#show_settings_sim_nickname').click
  else
    click_button('Save')
  end
sleep(10)
end

Then /^I will ([^"]*) New Nickname$/ do |see_not_see|
detail_text = first('div.setting-option-details-text').text()
if see_not_see == "not see"
  #find('div.setting-option-details-text', :text => "Kurt")
  #page.should have_no_css('div.setting-option-details-text[0]', :text => "Pedro")
  expect(detail_text).not_to eq("Pedro")
else
  expect(detail_text).to eq("Pedro")
end
find("a[href='/my-account/my-amaysim/logout']").click
sleep(10)
end


When /^I edit Recharge PIN$/ do
find('a#edit_settings_recharge_pin').click
sleep(10)
end

And /^I enter New Recharge PIN$/ do
find('input#my_amaysim2_setting_topup_pw').set($BASE_CONFIG["pin"])
end

And /^I ([^"]*) the updates$/ do |accept_cancel|
if accept_cancel == "Cancel"
  find("a[href='/my-account/my-amaysim/settings/730817?partial=recharge_pin']").click
  
else  
  click_button('Save')
  
end
sleep(10)
end

Then /^the New Recharge PIN will ([^"]*)$/ do |display_not_display|
pin_text = find('div#settings_recharge_pin div.setting-option-details-text').text
if display_not_display == "not display"  
  expect(pin_text).not_to be("1234")
  #find('div.setting-option-details-text', :text => "5678")
else
  expect(pin_text).to eq("1234")
end
find("a[href='/my-account/my-amaysim/logout']").click
sleep(10)
end

And /^I check caller_id_option checkbox$/ do
page.execute_script("$('#my_amaysim2_setting_caller_id_out').attr('checked', true)")
page.execute_script("$('#edit_setting_caller_id_out_730817').submit()")
sleep(10)
end

Then /^I will see Success Notification popup$/ do
find('p.popup-content', :text => "We have successfully updated your SIM settings.")
end

And /^I check call_waiting_option checkbox$/ do
page.execute_script("$('#my_amaysim2_setting_caller_waiting').attr('checked', true)")
page.execute_script("$('#edit_setting_caller_waiting_730817').submit()")
sleep(10)
end


And /^I check voicemail_option checkbox$/ do
page.execute_script("$('#my_amaysim2_setting_voice_mail').attr('checked', true)")
page.execute_script("$('#edit_setting_voice_mail_730817').submit()")
sleep(10)
end

And /^I check usage_alerts_option checkbox$/ do
find('label[for="my_amaysim2_setting_usage_alert"]').click
sleep(10)
end


Then /^I will see Confirmation popup$/ do
page.should have_css('div#confirm_popup.reveal-modal.confirm-modal.padding-none.open')
end


When /^I click confirmation_option$/ do
find('a#confirm_popup_yes').click
sleep(10)
end


And /^I check international_roaming_option checkbox$/ do
find('label[for="my_amaysim2_setting_intl_roaming"]').click
sleep(10)
end


When /^I click call_forwarding Edit link$/ do
find('a#edit_settings_call_forwarding').click
sleep(10)
page.should have_css('div.form_confirm_popup')
find('a.confirm_popup_confirm').click
sleep(10)
end

And /^I enter new call_forwarding number$/ do
find('input#my_amaysim2_setting_call_divert_number').set("0412345678")
end


And /^I click Othersave button$/ do
find('Input[name="commit"]').click
sleep(10)
end