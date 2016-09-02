require "spec_helper"
require "capybara"
require "cucumber"

describe "RBC BB Customer journey widget Cross Browser", :sauce => true do
	it "Should successfully complete E2E test of current functionality" do
# Visits the RBC staging widget with a pre defined URL
	visit 'http://bespoke.bookingbug.com/rbc/staging/new_customer.html?firstName=Test&lastName=Automation&mobile=5815000800'
	expect(page).to have_content 'How would you like to connect'
	find('.text-center.service-item', :text => 'Video Conference').click
	sleep 10
       	find_button('Confirm').click
	find('i.rbc-icon-arrow-down.avail-text', match: :first).click
        find('li.time-slot.ng-scope', match: :first).click   
        find_button('Continue').click  
        find_button('Confirm').click
        #find('#loading_icon')
# End of current functionality for now.        
  end
end
