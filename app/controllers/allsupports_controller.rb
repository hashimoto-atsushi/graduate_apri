class AllsupportsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @support_programs = SupportProgram.all
  end
end
