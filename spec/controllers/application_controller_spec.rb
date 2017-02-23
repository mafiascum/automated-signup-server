require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      raise CanCan::AccessDenied
    end
  end

  describe 'when not authorized' do
    login_player

    it 'returns HTTP status 403 (Forbidden)' do
      get :index
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'when not authenticated' do
    it 'returns HTTP status 401 (Unauthorized)' do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
