require 'rails_helper'

feature 'User can loguot', %q{
  In order to change acc
  As an authenticated User
  i'd like to be able to sign out
} do

  given(:user) { create(:user) }

  describe 'Authenticated user' do
    scenario 'tries to logout' do
      sign_in(user)
      visit root_path
      
      click_on 'Exit'

      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  describe 'Unauthenticated user' do
    scenario 'tries to logout' do
      visit root_path
      expect(page).to_not have_link('Exit')
    end
  end
end
