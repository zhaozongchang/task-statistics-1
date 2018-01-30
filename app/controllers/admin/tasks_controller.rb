class Admin::TasksController < ApplicationController

  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to admin_task_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :score)
  end
end
