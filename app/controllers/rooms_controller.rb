class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.paginate(:per_page => 10, :page => params[:page])
  end

  # GET /available rooms
  def available_rooms
    @rooms = Room.paginate(:per_page => 10, :page => params[:page]).where(:is_available => true)
  end

  # GET /rooms/new
  def new
    room_types
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    room_types
  end

  # POST /rooms
  def create
    room_types
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_url, notice: 'Room was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /rooms/1
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to rooms_url, notice: 'Room was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:room_no, :room_type_id, :is_available, :rent)
    end

    # fetch all available room types
    def room_types
      @room_types = RoomType.all
    end
end
