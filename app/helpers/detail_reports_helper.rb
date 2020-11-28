module DetailReportsHelper
  def choose_new_or_edit_detail_report
    if action_name == 'new' || action_name == 'create'
      confirm_support_program_detail_reports_path
    elsif action_name == 'edit'
      detail_report_path
    end
  end
end
