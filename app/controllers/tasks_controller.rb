class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice:"タスクの登録が完了しました"
      else
        render :new
      end
    end
  end
  def edit
    @task = Task.find(params[:id])
  end
  def show
    @task = Task.find(params[:id])
  end
  def destroy
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました"
    else
      render :edit
    end
  end
  private
  def task_params
    params.require(:task).permit(:title, :content, :priority, :status, :limit)
  end
end
