class PledgesController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		# project.pledges.create(params[:pledge])

		@pledge = Pledge.new(pledge_params)
		@pledge.project = @project
		@pledge.backer = current_user

		if @pledge.save
			redirect_to project_path(@project) # "/projects/#{@project.id}"
		else
			render "projects/show"
		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:amount)
	end


end
