class BossCheckCommentsController < ApplicationController
  before_action :set_boss_check_comment, only: [:show, :edit, :update, :destroy]

  def index
    @boss_check_comments = BossCheckComment.all
  end

  def show
  end

  def new
    @boss_check_comment = BossCheckComment.new
  end

  def edit
  end

  def create
    @boss_check_comment = BossCheckComment.new(boss_check_comment_params)
      if @boss_check_comment.save
        redirect_to @boss_check_comment, notice: '作成しました！'
      else
        render :new
      end
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
