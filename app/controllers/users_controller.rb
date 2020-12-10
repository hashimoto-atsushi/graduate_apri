class UsersController < ApplicationController
  before_action :authenticate_user!
  PER = 10
  def index
    @search = User.search(params[:q])
    @users = @search.result(distinct: true).order(employee_number: :asc).page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
  end
end
