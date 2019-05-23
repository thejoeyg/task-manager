class ProjectsController < ApplicationController
  before_action :find_project, except: [:index, :create, :new]

  def index
    @projects = Project.all
  end

  def create
    @project = Project.create!(project_params)
    redirect_to project_path(@project.id)
  end

  def new; end

  def show
    @tasks = @project.tasks
  end

  def edit; end

  def update
    @project.update(project_params)

    redirect_to project_path(@project.id)
  end

  def destroy
    @project.destroy
    
    redirect_to projects_path
  end

  private

  def project_params
    params.permit([:name])
  end

  def find_project
    @project ||= Project.find(params[:id])
  end
end
