require 'rails_helper'

feature 'User can login', %q{
  In order to create a character
  As an unauthenticated User
  i'd like to be able to login
} do

  given(:user) { create(:user) }

  background { visit new_user_session_path }

  scenario 'Registered user tries to login' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_content("Signed in successfully.")
  end

  scenario 'Unregistered user tries to login' do
    fill_in 'Email', with: 'wrong@email.com'
    fill_in 'Password', with: 'WrongPassword'
    click_on 'Log in'

    expect(page).to have_content("Invalid Email or password.")
  end
end
