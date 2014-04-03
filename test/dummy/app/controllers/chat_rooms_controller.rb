class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: [:show, :edit, :update, :destroy]

  # GET /chat_rooms
  def index
    @chat_rooms = ChatRoom.all
  end

  # GET /chat_rooms/1
  def show
  end

  # GET /chat_rooms/new
  def new
    @chat_room = ChatRoom.new
  end

  # GET /chat_rooms/1/edit
  def edit
  end

  # POST /chat_rooms
  def create
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      redirect_to @chat_room, notice: 'Chat room was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /chat_rooms/1
  def update
    if @chat_room.update(chat_room_params)
      redirect_to @chat_room, notice: 'Chat room was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /chat_rooms/1
  def destroy
    @chat_room.destroy
    redirect_to chat_rooms_url, notice: 'Chat room was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chat_room_params
      params.require(:chat_room).permit(:order, :performer_name, :customer_name, :duration, :call_type)
    end
end
