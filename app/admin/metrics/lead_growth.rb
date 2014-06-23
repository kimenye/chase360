ActiveAdmin.register_page "Lead Growth"  do

	menu :parent => "Reports"

  content do
    @metric = Lead.group_by_day(:created_at, day_start: 2).count
    render :partial => 'metrics/line_chart', :locals => {:metric => @metric}
  end

end  