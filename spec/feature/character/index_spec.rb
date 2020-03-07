require 'rails_helper'

feature 'User can see list of his characters', %q{
  In order to see all my characters
  As an authenticated user
  I'd like to be able to see the list of characters
} do
  given(:user) { create(:user) }

  describe 'Authenticated user' do
    given!(:characters) { create_list(:character, 2, user: user) }
    given!(:another_character) { create(:character) }

    scenario 'user can see list of HIS characters through the profile' do
      sign_in(user)
      visit user_path(user)

      click_on 'Мои персонажи'

      characters.each do |character|
        expect(page).to have_link character.name
      end
      expect(page).to_not have_link another_character.name
    end
  end

  describe 'Unauthenticated user' do
    scenario 'tries entering to his profile' do
      visit user_path(user)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
