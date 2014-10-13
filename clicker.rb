require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'pry'

EMAIL_ADDRESS = 'ngthanhtrung23@gmail.com'
PASSWORD = 'Trung23'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_selector = :css
Capybara.default_wait_time = 10

describe 'Travel Smart clicker', :type => :feature do
  it 'click until no point left' do
    # Login to website
    Capybara.reset_session!
    puts 'Go to website'
    visit 'https://www.travelsmartrewards.sg/'

    # Fill the login form
    expect(page).to have_content("Incentives for Singapore's Commuters")
    fill_in 'Email', with: EMAIL_ADDRESS
    fill_in 'Password', with: PASSWORD
    click_on 'Login'

    # Check to make sure we are on the correct page
    expect(page).to have_content('Spin to Win')

    # Start the game!
    find('#wgt-game').click
    sleep 5

    # Now the popup should shows, all left is to click
    within_frame find('.fancybox-iframe')[:id] do
      nturn = find('#points').native.text.to_i / 10
      nturn.times do
        find('#spin1').click
        sleep 10
      end
    end
  end
end
