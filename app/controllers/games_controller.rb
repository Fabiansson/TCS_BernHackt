class GamesController < ApplicationController
  before_action :set_game, only: :show

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end
end
