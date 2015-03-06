class PledgesController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		# project.pledges.create(params[:pledge])

		@pledge = Pledge.new(pledge_params)
		@pledge.project = @project
		@pledge.backer = current_user

		respond_to do |format|
			if @pledge.save
				format.html { redirect_to project_path(@project) }
				format.js {}
			else
				format.html { render 'new'}
				format.js
			end																							 

		end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:amount, :project_id, :backer_id)
	end
end
