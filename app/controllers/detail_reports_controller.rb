class DetailReportsController < ApplicationController
  before_action :set_detail_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :tech_and_admin_login, only: [:create, :update, :destroy]
  PER = 10

  def index
    @detail_reports = DetailReport.all.order(support_program_id: :asc).page(params[:page]).per(PER)
  end

  def show
    @support_program = @detail_report.support_program.id
  end

  def new
    @support_program = SupportProgram.find(params[:support_program_id])
    @detail_report = DetailReport.new
  end

  def edit
  end

  def create
    @detail_report = DetailReport.new(detail_report_params)
    if params[:back]
      render :new
    else
      if @detail_report.save
        UserMailer.detail_report_mail_to_sales(@detail_report).deliver
        UserMailer.detail_report_mail_to_tech(@detail_report).deliver
        UserMailer.detail_report_mail_to_tech_boss(@detail_report, tech_boss).deliver
        redirect_to @detail_report, notice: t('detail_reports.create')
      else
        redirect_to new_support_program_detail_report_path(@detail_report.support_program.id)
      end
    end
  end

  def confirm
    @support_program = SupportProgram.find(params[:support_program_id])
    @detail_report = DetailReport.new(detail_report_params)
    render :new if @detail_report.invalid?
  end

  def update
    if @detail_report.update(detail_report_params)
      redirect_to @detail_report, notice: t('detail_reports.edit')
    else
      render :edit
    end
  end

  def destroy
    @detail_report.destroy
    redirect_to detail_reports_url, notice: t('detail_reports.delete')
  end

  private
    def set_detail_report
      @detail_report = DetailReport.find(params[:id])
    end

    def detail_report_params
      params.require(:detail_report).permit(:support_program_id, :ordered_date, :ordered_price, :actual_kickoff_date, :actual_complete_date, :service_detail, :photo, :results, :evaluation, :evaluation_details)
    end
end
