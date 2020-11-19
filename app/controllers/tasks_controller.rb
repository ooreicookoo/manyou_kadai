class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all.order(created_at: :desc)
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
  end
  def show
  end
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました"
    else
      render :edit
    end
  end
  private
  def task_params
    params.require(:task).permit(:title, :content)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
