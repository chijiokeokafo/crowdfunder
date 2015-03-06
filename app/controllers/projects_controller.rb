class ProjectsController < ApplicationController
	def index
    if params[:search]
      @projects = Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
    else
		  @projects = Project.all
	  end

    respond_to do |format|
      format.html do
        if params[:autocomplete]
          @projects = @projects.limit(10)
          render partial: "autocomplete"
        else
          render
        end
      end
      format.js
    end
  end

	def show
		@project = Project.find(params[:id])
		@pledge = Pledge.new

	end

	def new
		if current_user
			@project = Project.new
			@project.start_date = Date.today
		else
			redirect_to login_path
		end
	end

	def create
		@project = Project.new(project_params)
		
		if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def destroy
  	@project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end


	private
	def project_params
		params.require(:project).permit(:title, :description, :funding_goal, :start_date, :end_date, :category)
	end
end


