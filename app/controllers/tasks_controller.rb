# frozen_string_literal: true

# TasksController
class TasksController < ApplicationController
  before_action :require_login

  layout 'registration'

  def index
    @tasks = current_user.tasks
  end

  def show
    @task = current_user.tasks.find_by(id: params[:id])
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
    @task = current_user.tasks.find_by(id: params[:id])
  end

  def create
    unless current_user.nil?
      @task = current_user.tasks.new(task_params)
      @task.user_id = current_user.id
    end
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    @task = current_user.tasks.find_by(id: params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = current_user.tasks.find_by(id: params[:id]).try(:destroy)
    redirect_to tasks_path
  end

  def destroy_completed
    @tasks = current_user.tasks.where(complete: true).try(:destroy_all)
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :text, :complete)
  end
end
