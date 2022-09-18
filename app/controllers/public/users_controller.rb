class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  end

  def show
    @user=User.find(params[:id])
    @requests=@user.requests
    @reports=@user.reports
  end

  def edit
    @user=User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user.id)
    end
  end
  
  def update
    @user=current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def request_likes
  end

  def report_likes
  end

  def unsubscribe
  end
  
  def withdraw
    @user=current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :self_introduction, :is_deleted)
  end
end
