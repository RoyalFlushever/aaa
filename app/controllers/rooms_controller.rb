class RoomsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create]

  # GET /rooms
  def index
    @rooms = Room.all
  end

  # GET /rooms/:id
  def show
    
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.'}
      else
        format.html { render :new }
      end
    end
  end


  private
    def room_params
      params.require(:room).permit(:room_type, :home_type, :accommodate, :bedroom, :bathroom)
    end

end
