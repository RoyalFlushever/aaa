class RoomsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

end
