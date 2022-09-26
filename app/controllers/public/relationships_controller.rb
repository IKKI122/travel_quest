class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create #フォローする
    following=current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer
  end
  
  def destroy #フォローを外す
    following=current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer
  end
end
