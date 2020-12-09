class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_session_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    if paramas[:back]
      render :edit
    else
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice: '編集しました'
      else
        render :edit
      end
    end
  end
  def show
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache)
  end
  def check_user
    if current_user.id != @user.id
       redirect_to user_path, notice: '権限がありません'
    end
  end
end
