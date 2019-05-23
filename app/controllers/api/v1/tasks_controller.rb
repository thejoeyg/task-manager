class Api::V1::TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: [:show, :update, :destroy]

  def index
    @tasks = @project.tasks
    render json: @tasks
  end

  def create
    task = @project.tasks.create(task_params)

    render json: task, status: :created
  end

  def show
    render json: @task
  end

  def update
    @task.update_attributes!(task_params)
    head :no_content
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def find_project
    @project ||= Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find_by(id: params[:id]) if @project
  end

  def task_params
    params.require(:task).permit(:title, :description, :urgent, :deadline_at, :complete)
  end
end
