ActiveAdmin.register_page "Product Distribution"  do

	menu :parent => "Reports"

  content do
    @metric = Lead.group(:product).count
    render :partial => 'metrics/bar_chart', :locals => {:metric => @metric}
  end

end  