class InstalledProductsController < ApplicationController
  before_action :set_installed_product, only: [:show, :edit, :update, :destroy]

  def index
    @installed_products = InstalledProduct.all
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
        format.html { redirect_to @installed_product, notice: 'Installed product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def confirm
    @installed_product = InstalledProduct.new(installed_product_params)
    render :new if @installed_product.invalid?
  end


  def update
      if @installed_product.update(installed_product_params)
        format.html { redirect_to @installed_product, notice: 'Installed product was successfully updated.' }
      else
        format.html { render :edit }
      end
  end

  def destroy
    @installed_product.destroy
      format.html { redirect_to installed_products_url, notice: 'Installed product was successfully destroyed.' }
  end

  private
    def set_installed_product
      @installed_product = InstalledProduct.find(params[:id])
    end

    def installed_product_params
      params.require(:installed_product).permit(:product_id, :serial_number, :installed_date, :discount_price)
    end
end
