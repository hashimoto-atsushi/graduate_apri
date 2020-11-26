class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  def index
    @parts = Part.all
  end

  def show
  end

  def new
    @part = Part.new
  end

  def edit
  end

  def create
    @part = Part.new(part_params)
    if params[:back]
      render :new
    else
      if @part.save
        redirect_to @part, notice: '作成しました！'
      else
        render :new
      end
    end
  end

  def confirm
    @part = Part.new(part_params)
  end

  def update
    if @part.update(part_params)
      redirect_to @part, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @part.destroy
      redirect_to parts_url, notice: '削除しました！'
  end

  private
    def set_part
      @part = Part.find(params[:id])
    end

    def part_params
      params.require(:part).permit(:detail_report_id, :name, :type_name, :category, :list_price, :stock, :release_date, :end_of_production, :end_of_service)
    end
end
