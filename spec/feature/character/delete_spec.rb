require 'rails_helper'

feature 'User can delete his character', %q{
  In order to delete a useless character
  As the creator of this character
  i'd like to be able to delete it
}, js: true do

  given(:user) { create(:user) }

  describe 'Authenticated user' do

    let!(:character){ create(:character, user: user)}
    let(:user2){ create(:user) }

    scenario 'is the creator of this character' do
      sign_in(user)
      visit characters_path

      expect(page).to have_link(character.name)

      click_on 'Удалить'

      expect(page).to_not have_link(character.name)
    end

    scenario 'is NOT the creator of this character' do
      sign_in(user2)
      visit characters_path
      expect(page).to_not have_link(character.name)
      expect(page).to_not have_link('Удалить')
    end
  end

  describe 'Unauthenticated user' do
    scenario 'tries entering his profile' do
      visit user_path(user)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
