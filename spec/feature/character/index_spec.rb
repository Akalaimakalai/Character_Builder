require 'rails_helper'

feature 'User can see list of his characters', %q{
  In order to see all my characters
  As an authenticated user
  I'd like to be able to see the list of characters
} do
  given(:user) { create(:user) }
  given!(:character) { create_list(:character, 2, user: user) }

  describe 'Authenticated user' do
    scenario 'user visit medal page' do
      sign_in(user)
      visit user_path(user)

      click_on 'Мои персонажи'

      character.each do |character|
        expect(page).to have_link character.name
      end
    end
  end

  describe 'Unauthenticated user' do
    scenario 'tries entering his profile' do
      visit user_path(user)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
