class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :tech_and_admin_login, only: [:create, :update, :destroy]
  PER = 8

  def index
    @search = Part.search(params[:q])
    @parts = @search.result(distinct:true).order(id: :asc).page(params[:page]).per(PER)
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
        UserMailer.part_mail_to_sales(@part, current_user).deliver
        redirect_to @part, notice: '作成しました！'
      else
        render :new
      end
    end
  end

  def confirm
    @part = Part.new(part_params)
    render :new if @part.invalid?
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
