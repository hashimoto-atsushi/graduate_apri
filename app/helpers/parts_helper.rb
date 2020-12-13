module PartsHelper
  def choose_new_or_edit_part
    if action_name == 'new' || action_name == 'create'
      confirm_parts_path
    elsif action_name == 'edit'
      part_path
    end
  end
end
