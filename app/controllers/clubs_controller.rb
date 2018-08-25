class ClubsController < ApplicationController
  before_action :set_club, only: :show

  # GET /clubs/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end
end
