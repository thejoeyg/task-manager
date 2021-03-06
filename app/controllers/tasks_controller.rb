class TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: [:show, :update, :destroy]

  def index
    @tasks = @project.tasks
  end

  def create
    task = @project.tasks.create(task_params)
    redirect_to project_path(@project.id)
  end

  def show; end
  def new; end

  def update
    @task.update_attributes!(task_params)
    redirect_to project_path(@project.id)
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project.id)
  end

  private

  def find_project
    @project ||= Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find_by(id: params[:id]) if @project
  end

  def task_params
    params.permit(:title, :description, :urgent, :deadline_at, :complete)
  end
end
