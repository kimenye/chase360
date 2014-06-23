ActiveAdmin.register_page "User Growth"  do

	menu :parent => "Reports"

  content do
    @metric = User.group_by_day(:created_at).count
    render :partial => 'metrics/line_chart', :locals => {:metric => @metric}
  end

end  