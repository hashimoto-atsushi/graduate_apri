module SupportProgramsHelper
  def choose_new_or_edit_support_program
    if action_name == 'new' || action_name == 'create'
      confirm_support_programs_path
    elsif action_name == 'edit'
      support_program_path
    end
  end
end
