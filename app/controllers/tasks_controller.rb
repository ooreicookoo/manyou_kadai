class TasksController < ApplicationController
  def index
  end
  def new
    @task = Task.new
  end
  def create
    Task.create(params.require(:task).permit(:title, :content, :priority, :status, :limit))
    redirect_to new_task_path
  end
  def edit
  end
end
