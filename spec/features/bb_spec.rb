require "spec_helper"
require "capybara"
require "cucumber"

#describe "BookingBug's admin interface", :sauce => true do
#  it "Should successfully load the angular booking journeyn" do
    
    
  Given (/^I navigate to ANZ staging$/) do
  visit 'https://anz-dev.bookingbug.com/'
end

Then  (/^the page has the word BookingBug$/) do
  expect(page).to have_content('BookingBug')
end

Then  (/^I can enter valid credentials$/) do
  fill_in('login_email', with: 'qa@bookingbug.com')
	 fill_in('login_password', with: 'qwaszx12')
end

Then  (/^click login$/) do
	click_button('Login')
	expect(page).to have_content('Current password')
		fill_in('login_current_password', with: 'qwaszx12')
	click_button('Change my password')
	 expect(page).to have_content('Jobs')
end

Then  (/^I move to the dashboard$/) do
  find_link('Logins').click
end

Then  (/^look for the Logins page$/) do
  expect(page).to have_content('Registered')
	 find_link('Search').click
end

When  (/^I enter an already existing members email address into search$/) do
	fill_in('as_admin__login-search-input', with: 'suzanne.dunn@anz.com')
	click_button('Search')
	
end

Then  (/^I see their login and nothing else in the results$/) do
  expect(page).to have_content('1 Found')
	 page.should_not have_content('16')
end

Then  (/^I can hover over the actions button to see the scaffold$/) do
  find('a.show_actions').click
    find('.fa-sticky-note-o').hover
end

Then  (/^click show$/) do
	find('i.fa.fa-sticky-note-o').click
end

Then  (/^Login as that User$/) do
  find_link('Login as User').click
end

Then  (/^I can limit the company result to only the store searched for$/) do
  visit 'https://anz-dev.bookingbug.com/login/login?select=business'
    fill_in('limit', with: 'Bondi')

end

Then	(/^log in to that company$/) do
  find_link('Login').click
end

Then(/^I initiate an angular journey$/) do
  visit('https://anz-dev.bookingbug.com/view/dashboard/add_booking_frame?add_booking_menu=anz&base=anz&company_id=37017&iarray=128&jd=2457595')
end

And(/^I see the angular journey load$/) do
  expect(page).to have_content('Make a Booking')
end

When(/^I select the first service form the drop down menu$/) do
select('0', from: 'service',  match: :first)	
end

Then(/^I can click the Book button$/) do
  find_button('Book').click
end

Then(/^I see available time slots$/) do
	
	
  expect(page).to have_content('Select a time')
  

  
  
  page.save_screenshot('/var/lib/jenkins/userContent/anz-classic/widget/a.png')
page.save_screenshot('/var/lib/jenkins/userContent/anz-classic/widget/b.png')
expect(page).to have_css('span.period-label.ng-binding')
find('div.times', match: :first).click


page.save_screenshot('/var/lib/jenkins/userContent/anz-classic/widget/c.png')
#binding.pry

find('li.time-slot.ng-scope', match: :first, wait: 5).trigger('click')
page.save_screenshot('/var/lib/jenkins/userContent/anz-classic/widget/d.png')
find_button('Book').click
page.save_screenshot('/var/lib/jenkins/userContent/anz-classic/widget/e.png')
end

Then (/^I select the first available time slot$/) do 
	page.save_screenshot('/var/lib/jenkins/userContent/anz-classic/widget/f.png')
#find('li.time-slot.ng-scope').click

end

And (/^I am able to proceed via the Book button$/) do
find_button('Book').click
expect(page).to have_content('Select a customer')
end

Then(/^Then I create a customer with a valid first name$/) do
fill_in('first_name', with: 'Bowserz')	
end

Then(/^Then a valid second name$/) do
	fill_in('last_name', with: 'Castle')
end

And(/^A valid email address$/) do
fill_in('email', with: 'aaron@putsbox.com')
	find_button('Create Customer').click	
end

Then(/^I click the Confirm button in the summary$/) do
	find_button('Confirm').click
end

Then(/^I finish the booking and see confirmation$/) do
 expect(page).to have_content('Confirmation')

end

Then(/^I receive an email confirmation$/) do
puts 'Log into putsbox and delete email.'
visit('http://putsbox.com/users/sign_in')
  	fill_in('user_email', with: 'jfenton@bookingbug.com')
  	fill_in('user_password', with: 'apiapiapi1')
 	find_button('Sign in').click
 	visit('http://putsbox.com/aaron/inspect')
expect(page).to have_content('Bondi')
new_window = window_opened_by {find_link('HTML').click}
    within_window new_window do
puts 'screenshot'
end


end


Then(/^this message will self destruct$/) do
 find_link('Clear History').click
        page.driver.accept_js_confirms!
        page.should_not have_content('Bondi')

end

Then(/^I can cancel the booking and see confirmation$/) do
 visit('https://anz-dev.bookingbug.com/space/activity')
find_link('Recent New Bookings').click
#find_link('Search')[1].click
within('#confContent') do
find_link('Search', match: :first).click
end

visit('https://anz-dev.bookingbug.com/client/future?id=246')
 find('a.show_actions', match: :first).click
sleep 2   
 find_link('Cancel', match: :first).click
 find_link('Cancel Booking').click
 find_link('Cancel Booking').click

end

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#  end
#end
