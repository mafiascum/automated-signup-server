# Controller to manage game queues
class GameQueuesController < ApplicationController
  load_and_authorize_resource

  def index
    respond_with @game_queues
  end

  def show
    respond_with @game_queues
  end

  def create
    if @game_queue.save
      head :created, location: game_queue_path(@game_queue)
    else
      render json: {error: @game_queue.errors}, status: :bad_request
    end
  end

  def update
    if @game_queue.update_attributes(update_params)
      head :ok
    else
      render json: {error: @game_queue.errors}, status: :bad_request
    end
  end

  def destroy
    @game_queue.destroy
    head :ok
  end

  private

  def create_params
    params.require(:game_queue).permit(:name, :description, :forum_id)
  end

  def update_params
    params.require(:game_queue).permit(:name, :description, :forum_id)
  end
end
