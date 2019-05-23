class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, except: [:index, :create]

  def index
    @projects = Project.all
    render json: @projects
  end

  def create
    @project = Project.create!(project_params)
    render json: @project, status: :created

  def show
    render json: @project
  end

  def update
    @project.update(project_params)
    head :no_content
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def project_params
    params.require(:project).permit([:name])
  end

  def find_project
    @project ||= Project.find(params[:id])
  end
end
