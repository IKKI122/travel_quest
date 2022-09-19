class Public::RequestCommentsController < ApplicationController
  def create
    @request=Request.find(params[:request_id])
    @request_comment=@request.request_comments.new(request_comment_params)
    @request_comment.user_id=current_user.id
    @request_comment.save
    redirect_to request_path(params[:request_id])
  end
  
  def destroy
    RequestComment.find(params[:id]).destroy
    redirect_to request_path(params[:request_id])
  end
  
  private

  def request_comment_params
    params.require(:request_comment).permit(:comment)
  end
end
