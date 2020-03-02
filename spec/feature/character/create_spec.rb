require 'rails_helper'

feature 'User can create character', %q{
  In order to get a character
  As an authenticated User
  i'd like to be able to create a new one
} do

  given(:user) { create(:user) }

  describe 'Authenticated user' do
    scenario 'create character with valid params' do
      sign_in(user)
      visit user_path(user)

      click_on 'Create new character'

      fill_in 'Name', with: 'TestCharName'

      click_on 'Create'

      expect(page).to have_content('TestCharName')
    end

    scenario 'create character with invalid params'
  end

  describe 'Unauthenticated user' do
    scenario 'tries entering his profile' do
      visit user_path(user)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
