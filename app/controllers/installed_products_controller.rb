class InstalledProductsController < ApplicationController
  before_action :set_installed_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :sales_and_admin_login, only: [:create, :update, :destroy]
  PER = 15

  def index
    @search = InstalledProduct.search(params[:q])
    @installed_products = @search.result(distinct:true).order(id: :asc).page(params[:page]).per(PER)
  end

  def show
  end

  def new
    @installed_product = InstalledProduct.new
  end

  def edit
  end

  def create
    @installed_product = InstalledProduct.new(installed_product_params)
    if params[:back]
      render :new
    else
      if @installed_product.save
        UserMailer.installed_product_mail_to_sales(@installed_product, current_user).deliver
        redirect_to @installed_product, notice: '作成しました！'
      else
        render :new
      end
    end
  end

  def confirm
    @installed_product = InstalledProduct.new(installed_product_params)
    render :new if @installed_product.invalid?
  end


  def update
      if @installed_product.update(installed_product_params)
        redirect_to @installed_product, notice: '編集しました！'
      else
        render :edit
      end
  end

  def destroy
    @installed_product.destroy
      redirect_to installed_products_url, notice: '削除しました！'
  end

  private
    def set_installed_product
      @installed_product = InstalledProduct.find(params[:id])
    end

    def installed_product_params
      params.require(:installed_product).permit(:product_id, :customer_id, :serial_number, :installed_date, :discount_price)
    end
end
