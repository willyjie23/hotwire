class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :password, :check_password]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    @room = Room.new
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @messages = Message.all
    @message = Message.new
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit; end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: '開房啦' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: '開房啦' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def password
    redirect_to @room if @room.password.empty?
  end

  def check_password
    if @room.password == params[:password]
      redirect_to @room, notice: '密碼正確'
    else
      redirect_to rooms_url, notice: '密碼錯誤'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:message, :name, :password)
    end
end
