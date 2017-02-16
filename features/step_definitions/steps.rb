Given /^I am a registered user$/ do 
visit('')
click_link('Login')
find('input#mobile_number').set($BASE_CONFIG["username"])
find('input#password').set($BASE_CONFIG["password"])
click_button('Login')
sleep(20)
expect(page).to have_css('div#welcome_popup')
find('div#welcome_popup a.close-reveal-modal').click
end

And /^I click My Settings link$/ do
find("a[href='/my-account/my-amaysim/settings']").click
sleep(10)
check_nickname = find('div#settings_sim_nickname .setting-option-details-text').text
check_pin = find('div#settings_recharge_pin div.setting-option-details-text').text
if check_nickname == ($BASE_CONFIG["new_nickname"])
  find('a#edit_settings_phone_label').click
  sleep(10)
  find('input#my_amaysim2_setting_phone_label').set($BASE_CONFIG["old_nickname"])
  click_button('Save')
  sleep(10)
end

if check_pin == ($BASE_CONFIG["new_pin"])
  find('a#edit_settings_recharge_pin').click
  sleep(10)
  find('input#my_amaysim2_setting_topup_pw').set($BASE_CONFIG["old_pin"])
  click_button('Save')
  sleep(10)
end
end

When /^I edit Nickname$/ do 
find('a#edit_settings_phone_label').click
sleep(10)
end

And /^I enter New Nickname$/ do
find('input#my_amaysim2_setting_phone_label').set($BASE_CONFIG["new_nickname"])
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
  expect(detail_text).not_to eq($BASE_CONFIG["new_nickname"])
else
  expect(detail_text).to eq($BASE_CONFIG["new_nickname"])
end
find("a[href='/my-account/my-amaysim/logout']").click
sleep(10)
end


When /^I edit Recharge PIN$/ do
find('a#edit_settings_recharge_pin').click
sleep(10)
end

And /^I enter New Recharge PIN$/ do
find('input#my_amaysim2_setting_topup_pw').set($BASE_CONFIG["new_pin"])
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
  expect(pin_text).not_to be($BASE_CONFIG["new_pin"])
else
  expect(pin_text).to eq($BASE_CONFIG["new_pin"])
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