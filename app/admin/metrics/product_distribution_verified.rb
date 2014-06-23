ActiveAdmin.register_page "Verified Product Distribution"  do

	menu :parent => "Reports"

  content do
    @metric = Lead.where(status: "Verified").group(:product).sum(:value)
    render :partial => 'metrics/bar_chart', :locals => {:metric => @metric}
  end

end  