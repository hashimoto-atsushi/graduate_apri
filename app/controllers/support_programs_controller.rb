class SupportProgramsController < ApplicationController
  before_action :set_support_program, only: [:show, :edit, :update, :destroy]

  def index
    @support_programs = SupportProgram.all
  end

  def show
  end

  def new
    @support_program = SupportProgram.new
  end

  def edit
  end

  def create
    @support_program = SupportProgram.new(support_program_params)
    if params[:back]
      render :new
    else
      if @support_program.save
        redirect_to @support_program, notice: '作成しました'
      else
        render :new
      end
    end
  end

  def confirm
    @support_program = SupportProgram.new(support_program_params)
    render :new if @support_program.invalid?
  end

  def update
    if @support_program.update(support_program_params)
      redirect_to @support_program, notice: '編集しました'
    else
      render :edit
    end
  end

  def destroy
    @support_program.destroy
      redirect_to support_programs_url, notice: '削除する'
  end

  private
    def set_support_program
      @support_program = SupportProgram.find(params[:id])
    end

    def support_program_params
      params.require(:support_program).permit(:customer_id, :user_id, :title_number, :title, :main_work, :planed_or_argent, :order_status, :kick_off_date, :closed)
    end
end