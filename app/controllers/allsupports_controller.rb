class AllsupportsController < ApplicationController
  before_action :authenticate_user!
  PER = 10

  def index
    @support_programs = SupportProgram.all.page(params[:page]).per(PER)
  end
end
