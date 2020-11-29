class AllsupportsController < ApplicationController
  def index
    @support_programs = SupportProgram.all
  end
end
