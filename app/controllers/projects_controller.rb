class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		render
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
		@project.rewards.build
	end

	def create
		@project = Project.new(project_params)
		
		if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end


	private
	def project_params
		params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date, :category, rewards_attributes: [:description])
	end
end


