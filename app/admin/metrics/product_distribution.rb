ActiveAdmin.register_page "Product Distribution By Numbers"  do

	menu :parent => "Reports"

  content do
    @metric = Lead.group(:product).count
    render :partial => 'metrics/bar_chart', :locals => {:metric => @metric}
  end

end  