class SupportProgramsController < ApplicationController
  before_action :set_support_program, only: [:show, :edit, :update, :destroy]
  before_action :mail_to_systems, only: [:create]
  before_action :authenticate_user!
  before_action :tech_and_admin_login, only: [:create, :update, :destroy]
  PER = 8

  def index
    @search = SupportProgram.search(params[:q])
    @support_programs = @search.result(distinct:true).order(title_number: :asc).page(params[:page]).per(PER)
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
        UserMailer.support_program_mail_to_tech(@support_program).deliver
        UserMailer.support_program_mail_to_sales(@support_program).deliver
        systems_members.each do | systems_member |
          UserMailer.mail_to_system(@support_program, systems_member).deliver
        end
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

    def mail_to_systems
      @user = User.where(department: 2)
    end
end
