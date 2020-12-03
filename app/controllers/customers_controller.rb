class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    if params[:query].present?
      @customers = Customer.where("first_name like '%#{params[:query]}%' or middle_name like '%#{params[:query]}%' or last_name like '%#{params[:query]}%'")
                       .paginate(:per_page => 10, :page => params[:page])
    else
      @customers = Customer.paginate(:per_page => 10, :page => params[:page])
    end
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /customers/1
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_url, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
    end
  end

  def search_customer
    redirect_to customers_path(:query => params[:customer][:query])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :middle_name, :last_name, :address, :phone, :email, :gender, :age, :status)
    end
end
