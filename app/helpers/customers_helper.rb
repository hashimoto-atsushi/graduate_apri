module CustomersHelper
  def choose_new_or_edit_customer
    if action_name == 'new' || action_name == 'create'
      confirm_customers_path
    elsif action_name == 'edit'
      customer_path
    end
  end
end
