require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_admin

  let(:other_user) do
    FactoryGirl.create(:user)
  end

  let(:valid_update_params) do
    {role: :listmod}
  end

  let(:invalid_update_params) do
    {role: nil}
  end

  describe '#index' do
    before do
      other_user.reload
      get :index
    end

    it 'assigns all users as @users' do
      expect(assigns[:users]).to eq([user, other_user])
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#update' do
    context 'with valid parameters' do
      before do
        put :update, params: {id: other_user.id, user: valid_update_params}
      end

      it 'updates the requested user' do
        other_user.reload
        expect(other_user.updated_at).not_to eq(other_user.created_at)
      end

      it 'returns HTTP status 200 (OK)' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns HTTP status 400 (Bad Request)' do
        put :update, params: {id: other_user.id, user: invalid_update_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#reset_token' do
    it 'resets the token' do
      expect { put :reset_token, params: {id: other_user.id} }.to change { other_user.reload.token }
    end

    it 'returns HTTP status 200 (OK)' do
      put :reset_token, params: {id: other_user.id}
      expect(response).to have_http_status(:ok)
    end
  end
end
