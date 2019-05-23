class ProjectsController < ApplicationController
  before_action :find_project, except: [:index, :create, :new]

  def index
    @projects = Project.all
  end

  def create
    @project = Project.create!(project_params)
    render :show
  end

  def new; end

  def show; end

  def update
    @project.update(project_params)
    render :show
  end

  def destroy
    @project.destroy

  end

  private

  def project_params
    params.permit([:name])
  end

  def find_project
    @project ||= Project.find(params[:id])
  end
end
