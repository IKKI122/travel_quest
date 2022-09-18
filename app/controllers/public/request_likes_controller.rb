class Public::RequestLikesController < ApplicationController
  def create
    request=Request.find(params[:request_id])
    request_like=current_user.request_likes.new(request_id: request.id)
    request_like.save
    redirect_to request_path(request.id)
  end
  
  def destroy
    request=Request.find(params[:request_id])
    request_like=current_user.request_likes.find_by(request_id: request.id)
    request_like.destroy
    redirect_to request_path(request.id)
  end
end
