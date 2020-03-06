require 'rails_helper'

feature 'User can create character', %q{
  In order to get a character
  As an authenticated User
  i'd like to be able to create a new one
} do

  given(:user) { create(:user) }

  describe 'Authenticated user' do

    background do
      sign_in(user)
      visit user_path(user)
      click_on 'Создать персонажа'
    end

    scenario 'create character with valid params' do
      fill_in 'Name', with: 'TestCharName'

      click_on 'Создать'

      expect(page).to have_content('Имя: TestCharName')
      expect(page).to have_content('Уровень: 1')

      within '.characteristics' do
        expect(page).to have_content('Сила: 8 (-1)')
        expect(page).to have_content('Ловкость: 8 (-1)')
        expect(page).to have_content('Телосложение: 8 (-1)')
        expect(page).to have_content('Интелект: 8 (-1)')
        expect(page).to have_content('Мудрость: 8 (-1)')
        expect(page).to have_content('Харизма: 8 (-1)')
      end
    end

    scenario 'create character with invalid params' do
      fill_in 'Name', with: ''

      click_on 'Создать'

      expect(page).to have_content('1 error prohibited this character from being saved:')
      expect(page).to have_content("Name can't be blank")
    end
  end

  describe 'Unauthenticated user' do
    scenario 'tries entering his profile' do
      visit user_path(user)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
