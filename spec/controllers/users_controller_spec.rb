require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do
    let(:user) { create(:user) }

    context 'Authenticated user' do
      before do
        login(user)
        get :show, params: { id: user }
      end

      it 'renders show view' do
        expect(response).to render_template :show
      end
    end

    context 'Unauthenticated user' do
      before { get :show, params: { id: user } }

      it 'redirects to login' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
