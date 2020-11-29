module SalesCheckCommentsHelper
  def choose_new_or_edit_sales
    if action_name == 'new' || action_name == 'create'
      confirm_support_program_detail_report_boss_check_comment_sales_check_comments_path
    elsif action_name == 'edit'
      sales_check_comment_path
    end
  end
end
