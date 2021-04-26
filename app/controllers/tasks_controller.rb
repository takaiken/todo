class TasksController < ApplicationController

  def index
  	@tasks = Task.all.page(params[:page]).per(10)

  end

  def show 
  	@task = target_task params[:id]

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
  	@task = target_task params[:id]
  end

  def update
  	@task = target_task params[:id]
  	@task.update(task_params)
  	redirect_to @task
  end

  def destroy
  	@task = target_task params[:id]
    @task.destroy
    flash[:sucess] = "削除します"
  	redirect_to tasks_url
  end

  private
  def target_task task_id
  	current_user.tasks.where(id: task_id).take
  end

  def task_params
  	params.require(:task).permit(:title, :description, :image)
  end

end
