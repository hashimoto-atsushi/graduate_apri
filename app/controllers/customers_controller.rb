class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :sales_and_admin_login, only: [:create, :update, :destroy]
  PER = 8

  def index
    @search = Customer.search(params[:q])
    @customers = @search.result(distinct: true).order(customer_number: :asc).page(params[:page]).per(PER)
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def confirm
    @customer = Customer.new(customer_params)
    render :new if @customer.invalid?
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    if params[:back]
      render :new
    else
      if @customer.save
        UserMailer.customer_mail_to_sales(@customer).deliver
        redirect_to @customer, notice: '作成しました!'
      else
        render :new
      end
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: '編集しました!'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: '削除しました!'
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:user_id, :customer_number, :name, :phone_number, :profession, :customer_in_charge, :department, :position)
    end
end
