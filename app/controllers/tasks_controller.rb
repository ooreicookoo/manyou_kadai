class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :authenticate_user

  PER = 10
  
  def index
    if params[:sort_expired]
      @tasks = current_user.tasks.order(limit: :asc).page(params[:page]).per(PER)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.order(priority: :asc).page(params[:page]).per(PER)
    else
      @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(PER)
    end

    if params[:search].present?
      if params[:title].present? && params[:status].present?
        @tasks = current_user.tasks.title_search(params[:title]).status_search(params[:status]).page(params[:page]).per(PER)
      elsif params[:title].present?
        @tasks = current_user.tasks.title_search(params[:title]).page(params[:page]).per(PER)
      elsif params[:status].present?
        @tasks = current_user.tasks.status_search(params[:status]).page(params[:page]).per(PER)
      else
        @tasks = current_user.tasks.order(created_at: :desc)
      end
    end

    @tasks = current_user.tasks.all
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }).page(params[:page]).per(PER) if params[:label_id].present?
    @tasks = @tasks.page(params[:page]).per(PER)

  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    user_id = @current_user.id
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice:"task追加しました"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    unless params[:task][:label_ids]
      @task.labelings.delete_all
    end
      if params[:back]
        render :edit
    else
      if @task.update(task_params)
        redirect_to tasks_path, notice:"編集しました"
      else
        render :edit
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"削除しました"
  end

  private
  def task_params
    params.require(:task).permit(:title, :content,:limit, :status, :sort_expired, :priority, { label_ids: [] })
  end
  def set_task
    @task = Task.find(params[:id])
    unless @task.user == current_user
      redirect_to tasks_path
    end
  end

end
