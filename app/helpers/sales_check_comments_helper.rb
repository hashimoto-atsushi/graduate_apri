module SalesCheckCommentsHelper
  def choose_new_or_edit_sales
    if action_name == 'new' || action_name == 'create'
      confirm_sales_check_comments_path
    elsif action_name == 'edit'
      sales_check_comment_path
    end
  end
end
