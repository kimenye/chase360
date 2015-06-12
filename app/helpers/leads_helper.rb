module LeadsHelper

  def select_company?
    @products.nil? && @lead.product_id.nil?
  end

  def select_product?
    !@products.nil?
  end

  def enter_contact?
    !select_company? && !select_product?
  end

end
