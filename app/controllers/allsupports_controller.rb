class AllsupportsController < ApplicationController
  before_action :authenticate_user!
  PER = 30
  def index
    @support_programs = SupportProgram.all.page(params[:page]).per(PER)
  end
end
