module ProjectsHelper

	def days_in_future_for_select(n)
		options = (0..10).map do |n| 
			d = Time.now + n.days
			label = d.strftime("%A, %d %b %Y")
			value = d.strftime("%Y-%m-%d")
			[label, value] 
		end

		options_for_select(options)
	end
	
end
