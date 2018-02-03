class Admin::TasksController < ApplicationController

  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @tasks = Task.all.recent.paginate(:page => params[:page], :per_page => 10)
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

  def show
    @task = Tasl.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end


   def destroy
     @task = Task.find(params[:id])
     @task.destroy
     redirect_to admin_task_path
   end

  private

  def task_params
    params.require(:task).permit(:title, :description, :score)
  end
end
