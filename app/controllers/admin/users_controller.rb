class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :show
    end
  end
  
  def user_requests #ユーザーの投稿した依頼を一覧表示
    @user = User.find(params[:id])
    @user_requests = @user.requests.page(params[:page])#ユーザーが投稿した依頼を取得
  end
  
  def user_reports #ユーザーの投稿した報告を一覧表示
    @user = User.find(params[:id])
    @user_reports = @user.reports.page(params[:page]) #ユーザーが投稿した報告を取得
  end
  
  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :self_introduction, :is_deleted)
  end
end
