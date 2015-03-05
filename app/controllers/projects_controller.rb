class ProjectsController < ApplicationController
	def index
    @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
		  Project.all
		render
	  end

    if request.xhr?
      render @products
    end
  end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
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
		params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date, :category)
	end
end


