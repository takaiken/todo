class TasksController < ApplicationController

  protect_from_forgery

  def index
  	@tasks = Task.all.page(params[:page]).per(10)
  end

  def show 
  	@task = Task.find(params[:id])
    @like = Like.new
  end
  

  def new
  	@task = Task.new
  end

  def create
    @task = current_user.tasks.new task_params
    @task.save!
    redirect_to @task
  end

  def edit
  	@task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	@task.update(task_params)
  	redirect_to @task
  end

  def destroy
  	@task = Task.find(params[:id])
    @task.destroy
    flash[:sucess] = "削除します"
  	redirect_to tasks_url
  end

  private
  
  def task_params
  	params.require(:task).permit(:title, :description, :image)
  end

end
