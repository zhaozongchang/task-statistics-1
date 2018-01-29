class TasksController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :update, :destroy]
  before_action :find_task_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all.order("created_at DESC")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
    redirect_to tasks_path
  else
    render :new
  end
end

  def show
    @task = Task.find(params[:id])

  end

  def edit

  end

  def update

    if @task.update(task_params)
    redirect_to tasks_path
  else
    render :edit
   end
  end

  def destroy


    @task.destroy
    redirect_to tasks_path, alert: "删除成功"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :score)
  end

  def find_task_and_check_permission
    @task = Task.find(params[:id])
    if current_user != @task.user
      redirect_to root_path, alert: "你没有权限"
    end
  end

end
