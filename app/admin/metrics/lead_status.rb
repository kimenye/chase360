ActiveAdmin.register_page "Lead Status"  do

	menu :parent => "Reports"

  content do
    @metric = Lead.group(:status).count
    render :partial => 'metrics/pie_chart', :locals => {:metric => @metric}
  end

end  