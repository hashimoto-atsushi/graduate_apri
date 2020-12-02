class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @search = Product.search(params[:q])
    @products = @search.result(distinct: true)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if params[:back]
      render :new
    else
      if @product.save
        redirect_to @product, notice: '作成しました！'
      else
        format.html { render :new }
      end
    end
  end

  def confirm
    @product = Product.new(product_params)
    render :new if @product.invalid?
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: '削除しました'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :type_name, :category, :list_price, :release_date, :end_of_production, :end_of_service)
    end
end
