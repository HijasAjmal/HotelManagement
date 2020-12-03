class CheckOutRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_out_record, only: [:show, :edit, :update, :destroy]
  before_action :rooms, only: [:new, :create, :update, :edit]

  # GET /check_out_records
  def index
    @check_out_records = CheckOutRecord.all
  end

  # GET /check_out_records/1
  def show
  end

  # GET /check_out_records/new
  def new
    @check_out_record = CheckOutRecord.new
  end

  # GET /check_out_records/1/edit
  def edit
  end

  # POST /check_out_records
  def create
    @check_out_record = CheckOutRecord.new(check_out_record_params)

    respond_to do |format|
      if @check_out_record.save
        format.html { redirect_to check_out_records_url, notice: 'Check out record was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /check_out_records/1
  def update
    respond_to do |format|
      if @check_out_record.update(check_out_record_params)
        format.html { redirect_to check_out_records_url, notice: 'Check out record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /check_out_records/1
  def destroy
    @check_out_record.destroy
    respond_to do |format|
      format.html { redirect_to check_out_records_url, notice: 'Check out record was successfully destroyed.' }
    end
  end

  # select room and customer details
  def select_room
    @room = Room.find_by(:id => params[:room_id])
    @customer = @room.customer_details
    @total_amount, @days = @room.generate_checkout_details
    render json: {:total_amount => @total_amount, :days => @days, :customer_name => @customer.full_name, :customer_id => @customer.id}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_out_record
      @check_out_record = CheckOutRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def check_out_record_params
      params.require(:check_out_record).permit(:date, :room_id, :customer_id, :total_amount, :total_days, :reason)
    end

    # fetch all rooms
    def rooms
      @rooms = Room.all
    end
end
