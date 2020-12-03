class CheckInRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_in_record, only: [:show, :edit, :update, :destroy]
  before_action :rooms, only: [:new, :create, :update, :edit]

  # GET /check_in_records
  def index
    @check_in_records = CheckInRecord.paginate(:per_page => 10, :page => params[:page])
  end

  # GET /check_in_records/1
  def show
  end

  # GET /check_in_records/new
  def new
    @check_in_record = CheckInRecord.new
    @customer = @check_in_record.build_customer
  end

  # GET /check_in_records/1/edit
  def edit
  end

  # POST /check_in_records
  def create
    @check_in_record = CheckInRecord.new(check_in_record_params)
    respond_to do |format|
      if @check_in_record.save
        format.html { redirect_to check_in_records_url, notice: 'Check in record was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /check_in_records/1
  def update
    respond_to do |format|
      binding.pry
      if @check_in_record.update(check_in_record_params)
        format.html { redirect_to check_in_records_url, notice: 'Check in record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /check_in_records/1
  def destroy
    @check_in_record.destroy
    respond_to do |format|
      format.html { redirect_to check_in_records_url, notice: 'Check in record was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_in_record
      @check_in_record = CheckInRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def check_in_record_params
      params.require(:check_in_record).permit(:date, :room_id, customer_attributes: [:first_name, :middle_name, :last_name, :address, :email, :phone, :status, :age, :gender])
    end

    # fetch all rooms
    def rooms
      @rooms = Room.all
    end
end
