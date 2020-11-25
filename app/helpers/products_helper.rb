module ProductsHelper
  def choose_new_or_edit_product
    if action_name == 'new' || action_name == 'create'
      confirm_products_path
    elsif action_name == 'edit'
      product_path
    end
  end
end
