require "spec_helper"
require "capybara"
require "cucumber"

describe "BookingBug's admin interface", :sauce => true do
  it "Should successfully load the angular booking journeyn" do
  visit 'https://anz-dev.bookingbug.com/'

  expect(page).to have_content('BookingBug')

  fill_in('login_email', with: 'qa@bookingbug.com')
	 fill_in('login_password', with: 'qwaszx12')

	click_button('Login')
	expect(page).to have_content('Current password')
		fill_in('login_current_password', with: 'qwaszx12')
	click_button('Change my password')
	 expect(page).to have_content('Jobs')

  find_link('Logins').click

  expect(page).to have_content('Registered')
	 find_link('Search').click

	fill_in('as_admin__login-search-input', with: 'suzanne.dunn@anz.com')
	click_button('Search')
	


  expect(page).to have_content('1 Found')
	 page.should_not have_content('16')

  find('a.show_actions').click
    find('.fa-sticky-note-o').hover

	find('i.fa.fa-sticky-note-o').click

  find_link('Login as User').click

  visit 'https://anz-dev.bookingbug.com/login/login?select=business'
    fill_in('limit', with: 'Bondi')


  find_link('Login').click

  visit('https://anz-dev.bookingbug.com/view/dashboard/add_booking_frame?add_booking_menu=anz&base=anz&company_id=37017&iarray=128&jd=2457595')

  expect(page).to have_content('Make a Booking')

select('0', from: 'service',  match: :first)	

  find_button('Book').click


	
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

	page.save_screenshot('/var/lib/jenkins/userContent/anz-classic/widget/f.png')
#find('li.time-slot.ng-scope').click


find_button('Book').click
expect(page).to have_content('Select a customer')

fill_in('first_name', with: 'Bowserz')	

	fill_in('last_name', with: 'Castle')

fill_in('email', with: 'aaron@putsbox.com')
	find_button('Create Customer').click	

	find_button('Confirm').click

 expect(page).to have_content('Confirmation')


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



 find_link('Clear History').click
        page.driver.accept_js_confirms!
        page.should_not have_content('Bondi')


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
end
