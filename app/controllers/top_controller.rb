class TopController < ApplicationController
  before_action :authenticate_user!, except: [:new_guest]

  def index
  end

  def new_guest
    user = User.find_by(email: 'tech1@example.com')
    sign_in user
    redirect_to top_index_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
