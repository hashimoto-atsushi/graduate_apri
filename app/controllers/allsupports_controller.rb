class AllsupportsController < ApplicationController
  before_action :authenticate_user!
  PER = 20
  def index
    @support_programs = SupportProgram.all.order(title_number: :asc).page(params[:page]).per(PER)
  end
end
