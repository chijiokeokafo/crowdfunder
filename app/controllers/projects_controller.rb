class ProjectsController < ApplicationController
	def index
    if params[:search]
      @projects = Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
    else
		  @projects = Project.all
	  end

    respond_to do |format|
      format.html
      format.js do
        if params[:autocomplete]
          render partial: "autocomplete"
        else
          render
        end
      end
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


