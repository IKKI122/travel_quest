class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :request_likes, :report_likes, :followings, :followers, :user_requests, :user_reports]

  def index #退会していないユーザーのみ取得
    @users = User.where.not(is_deleted: true)
  end

  def show
    @user = User.find(params[:id])
    unless @user.is_deleted == false #依頼ユーザーが退会済みの場合はユーザー一覧に遷移
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def request_likes #いいねした依頼を一覧表示
    @user = User.find(params[:id])
    @request_likes=RequestLike.where(user_id: @user.id).page(params[:page]) #ユーザーがいいねした依頼を取得
  end

  def report_likes #いいねした報告を一覧表示
    @user = User.find(params[:id])
    @report_likes=ReportLike.where(user_id: @user.id).page(params[:page]) #ユーザーがいいねした報告を取得
  end

  def unsubscribe #退会の確認画面
    @user = current_user
  end
  
  def withdraw #会員ステータスを「退会」に更新
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  def followings #ユーザーの全フォローを取得
    user = User.find(params[:id])
    @users=user.followings
  end
 
  def followers #ユーザーの全フォロワーを取得
    user = User.find(params[:id])
    @users = user.followers
  end
  
  def user_requests #ユーザーの投稿した依頼を一覧表示
    @user = User.find(params[:id])
    @user_requests = @user.requests.page(params[:page])#ユーザーが投稿した依頼を取得
  end
  
  def user_reports #ユーザーの投稿した報告を一覧表示
    @user = User.find(params[:id])
    @user_reports =@user.reports.page(params[:page]) #ユーザーが投稿した報告を取得
  end
  
  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :self_introduction, :is_deleted)
  end
end
