class SalesCheckCommentsController < ApplicationController
  before_action :set_sales_check_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :sales_and_admin_login, only: [:create, :update, :destroy]

  def index
    @search = SalesCheckComment.search(params[:q])
    @sales_check_comments = @search.result(distinct:true)
  end

  def show
  end

  def new
    @boss_check_comment = BossCheckComment.find(params[:boss_check_comment_id])
    @sales_check_comment = SalesCheckComment.new
  end

  def edit
  end

  def create
    @sales_check_comment = SalesCheckComment.new(sales_check_comment_params)
    if params[:back]
      render :new
    else
      if @sales_check_comment.save
        UserMailer.sales_check_comment_mail_to_tech(@sales_check_comment).deliver
        UserMailer.sales_check_comment_mail_to_tech_boss(@sales_check_comment, tech_boss).deliver
        redirect_to @sales_check_comment, notice: '作成しました！'
      else
        render :new
      end
    end
  end

  def confirm
    @sales_check_comment = SalesCheckComment.new(sales_check_comment_params)
    render :new if @sales_check_comment.invalid?
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
