class BossCheckCommentsController < ApplicationController
  before_action :set_boss_check_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :boss_and_admin_display_login, only: [:create, :update, :destroy]

  def index
    @boss_check_comments = BossCheckComment.all
  end

  def show
    @support_program = @boss_check_comment.detail_report.support_program.id
    @detail_report = @boss_check_comment.detail_report.id
  end

  def new
    @detail_report = DetailReport.find(params[:detail_report_id])
    @boss_check_comment = BossCheckComment.new
  end

  def edit
  end

  def create
    @boss_check_comment = BossCheckComment.new(boss_check_comment_params)
    if params[:back]
      render :new
    else
      if @boss_check_comment.save
        UserMailer.boss_check_comment_mail_to_sales(@boss_check_comment).deliver
        UserMailer.boss_check_comment_mail_to_tech_boss(@boss_check_comment, tech_boss).deliver
        redirect_to @boss_check_comment, notice: '作成しました！'
      else
        render :new
      end
    end
  end

  def confirm
    @detail_report = DetailReport.find(params[:detail_report_id])
    @boss_check_comment = BossCheckComment.new(boss_check_comment_params)
    render :new if @boss_check_comment.invalid?
  end

  def update
      if @boss_check_comment.update(boss_check_comment_params)
        redirect_to @boss_check_comment, notice: '編集しました！'
      else
        render :edit
      end
  end

  def destroy
    @boss_check_comment.destroy
      redirect_to boss_check_comments_url, notice: '削除しました！'
  end

  private
    def set_boss_check_comment
      @boss_check_comment = BossCheckComment.find(params[:id])
    end

    def boss_check_comment_params
      params.require(:boss_check_comment).permit(:detail_report_id, :confirmation, :confirmation_date, :positive_comment, :negative_comment, :assistance, :questions, :report_to_sales)
    end
end
