require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  let(:user) { create(:user) }
  let(:character) { create(:character, user: user) }

  describe 'GET #show' do

    context 'Authenticated user' do
      before do
        login(user)
        get :show, params: { id: character }
      end

      it 'set correct char into @character' do
        expect(assigns(:character)).to eq character
      end

      it 'renders show view' do
        expect(response).to render_template :show
      end
    end

    context 'Unauthenticated user' do
      it_behaves_like 'unauthenticated' do
        before { get :show, params: { id: character } }
      end
    end
  end

  describe 'GET #new' do

    context 'Authenticated user' do
      before do
        login(user)
        get :new
      end

      it 'set new char into @character' do
        expect(assigns(:character)).to be_a_new(Character)
      end

      it 'renders new view' do
        expect(response).to render_template :new
      end
    end

    context 'Unauthenticated user' do
      it_behaves_like 'unauthenticated' do
        before { get :new }
      end
    end
  end

  describe 'POST #create' do

    context 'Authenticated user' do
      before { login(user) }

      context ' creates character with valid params' do
        it 'saves char in database' do
          expect { post :create, params: { character: { name: 'NewChar' } } }.to change(Character, :count).by(1)
        end

        it 'redirects to character show view' do
          post :create, params: { character: { name: 'NewChar' } }
          expect(response).to redirect_to character_path(assigns(:character))
        end
      end

      context ' creates character with invalid params' do
        it 'does not save char in database' do
          expect { post :create, params: { character: { name: '' } } }.to_not change(Character, :count)
        end

        it 'renders new view' do
          post :create, params: { character: { name: '' } }
          expect(response).to render_template :new
        end
      end
    end

    context 'Unauthenticated user' do
      it 'does not save char in database' do
        expect { post :create, params: { character: { name: '' } } }.to_not change(Character, :count)
      end

      it_behaves_like 'unauthenticated' do
        before { post :create, params: { character: { name: 'NewChar' } } }
      end
    end
  end
end
