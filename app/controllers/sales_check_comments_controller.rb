class SalesCheckCommentsController < ApplicationController
  before_action :set_sales_check_comment, only: [:show, :edit, :update, :destroy]

  def index
    @sales_check_comments = SalesCheckComment.all
  end

  def show
  end

  def new
    @sales_check_comment = SalesCheckComment.new
  end

  def edit
  end

  def create
    @sales_check_comment = SalesCheckComment.new(sales_check_comment_params)
      if @sales_check_comment.save
        redirect_to @sales_check_comment, notice: '作成しました！'
      else
        render :new
      end
  end

  def update
      if @sales_check_comment.update(sales_check_comment_params)
        redirect_to @sales_check_comment, notice: '編集しました！'
      else
        render :edit 
      end
  end

  def destroy
    @sales_check_comment.destroy
      redirect_to sales_check_comments_url, notice: '削除しました！'
  end

  private
    def set_sales_check_comment
      @sales_check_comment = SalesCheckComment.find(params[:id])
    end

    def sales_check_comment_params
      params.require(:sales_check_comment).permit(:boss_check_comment_id, :confirmation, :confirmation_date, :comments, :discussion_possibility, :matter_closed)
    end
end
