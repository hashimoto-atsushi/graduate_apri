module InstalledProductsHelper
  def choose_new_or_edit_installed_product
    if action_name == 'new' || action_name == 'create'
      confirm_installed_products_path
    elsif action_name == 'edit'
      installed_product_path
    end
  end
end
