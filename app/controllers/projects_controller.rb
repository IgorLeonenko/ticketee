class ProjectsController < ApplicationController
  before_action :find_project, only: :show

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show; end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render :new
    end
  end


  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
