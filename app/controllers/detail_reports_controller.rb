class DetailReportsController < ApplicationController
  before_action :set_detail_report, only: [:show, :edit, :update, :destroy]

  def index
    @detail_reports = DetailReport.all
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
        redirect_to @detail_report, notice: '作成しました！'
      else
        render :new
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
        redirect_to @detail_report, notice: '編集しました！'
      else
        render :edit
      end
  end

  def destroy
    @detail_report.destroy
    redirect_to detail_reports_url, notice: '削除しました！'
  end

  private
    def set_detail_report
      @detail_report = DetailReport.find(params[:id])
    end

    def detail_report_params
      params.require(:detail_report).permit(:support_program_id, :ordered_date, :ordered_price, :actual_kickoff_date, :actual_complete_date, :service_detail, :photo, :results, :evaluation, :evaluation_details)
    end
end
