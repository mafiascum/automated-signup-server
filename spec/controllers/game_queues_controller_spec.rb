require 'rails_helper'

RSpec.describe GameQueuesController, type: :controller do
  login_admin

  let(:game_queue) do
    FactoryGirl.create(:game_queue)
  end

  let(:valid_params) do
    FactoryGirl.attributes_for(:game_queue)
  end

  let(:invalid_params) do
    {name: nil, description: nil, forum_id: nil}
  end

  describe '#index' do
    before do
      game_queue.reload
      get :index
    end

    it 'assigns all game queues as @game_queues' do
      expect(assigns[:game_queues]).to eq([game_queue])
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    before do
      get :show, params: {id: game_queue.id}
    end

    it 'assigns the requested game queue as @game_queue' do
      expect(assigns[:game_queue]).to eq(game_queue)
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      it 'creates a new game queue' do
        expect { post :create, params: {game_queue: valid_params} }.to change(GameQueue, :count).by(1)
      end

      it 'returns HTTP status 201 (Created)' do
        post :create, params: {game_queue: valid_params}
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns HTTP status 400 (Bad Request)' do
        post :create, params: {game_queue: invalid_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#update' do
    context 'with valid parameters' do
      before do
        put :update, params: {id: game_queue.id, game_queue: valid_params}
      end

      it 'updates the requested game queue' do
        game_queue.reload
        expect(game_queue.updated_at).not_to eq(game_queue.created_at)
      end

      it 'returns HTTP status 200 (OK)' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns HTTP status 400 (Bad Request)' do
        put :update, params: {id: game_queue.id, game_queue: invalid_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#destroy' do
    it 'destroys the requested game queue' do
      game_queue.reload
      expect { delete :destroy, params: {id: game_queue.id} }.to change(GameQueue, :count).by(-1)
    end

    it 'returns HTTP status 200 (OK)' do
      delete :destroy, params: {id: game_queue.id}
      expect(response).to have_http_status(:ok)
    end
  end
end
