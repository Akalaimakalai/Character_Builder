require 'rails_helper'

feature 'User can sign up', %q{
  In order to become a registered user
  As an unregistered user
  i'd like to be able to sign up
} do

  describe 'User tries to sign up' do
    background { visit new_user_registration_path }

    scenario 'with correct input' do
      fill_in 'Name', with: 'TestUser'
      fill_in 'Email', with: 'user@test.xxx'
      fill_in 'Password', with: 'qwerty'
      fill_in 'Password confirmation', with: 'qwerty'
      click_on 'Sign up'

      open_email('user@test.xxx')

      expect(current_email).to have_content 'You can confirm your account email through the link below:'

      current_email.click_link 'Confirm my account'
      clear_emails

      expect(page).to have_content('Your email address has been successfully confirmed.')

      fill_in 'Email', with: 'user@test.xxx'
      fill_in 'Password', with: 'qwerty'

      click_on 'Log in'

      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'with wrong input' do
      fill_in 'Name', with: 'TestUser'
      fill_in 'Email', with: 'user@test.xxx'
      fill_in 'Password', with: 'qwerty'
      fill_in 'Password confirmation', with: 'ytrewq'
      click_on 'Sign up'

      expect(page).to have_content('1 error prohibited this user from being saved:')
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
