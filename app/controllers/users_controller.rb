class UsersController < ApplicationController
  def index
    @search = User.search(params[:q])
    @users = @search.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end
end
