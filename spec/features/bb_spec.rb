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
visit('https://anz-dev.bookingbug.com/admin/user/show?id=12&eid=65409b0d65b64321dbb22b3b4f4f24fb')

 expect(page).to have_content('Login as User', wait: 20)
  find_link('Login as User').click

  visit 'https://anz-dev.bookingbug.com/login/login?select=business'
    fill_in('limit', with: 'Bondi')


  find_link('Bondi Junction Westfield').click

  visit('https://anz-dev.bookingbug.com/view/dashboard/add_booking_frame?add_booking_menu=anz&base=anz&company_id=37017&iarray=128&jd=2457595')

  expect(page).to have_content('Make a Booking')

select('0', from: 'service',  match: :first)	

  find_button('Book').click


	
  expect(page).to have_content('Select a time')
  

  
  
 
expect(page).to have_css('span.period-label.ng-binding')
find('div.times', match: :first).click


puts 'calendar has loaded!!'

    
  end
end
