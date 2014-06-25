ActiveAdmin.register_page "User Growth"  do

	menu :parent => "Reports"
	# menu false

  content do
    # @metric = User.group_by_day(:created_at).count
    first_date = User.first.created_at.to_date
    last_date = User.last.created_at.to_date
    range = first_date..last_date
    days = range.to_a
    day_time = days.collect { |d| d.to_time }

    
    raw = User.all.group_by { |g| g.created_at.to_date }.collect { |group|  [group.first.to_time, group[1].length] }.to_h

    day_time.each do |day|
    	if !raw.has_key?(day)
    		raw[day] = 0
    	end
    end
    @metric = raw

    

    render :partial => 'metrics/line_chart', :locals => {:metric => @metric}
  end

end  