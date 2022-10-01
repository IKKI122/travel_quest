class Admin::RequestCommentsController < ApplicationController
  def destroy
    RequestComment.find(params[:id]).destroy
    redirect_to admin_request_path(params[:request_id])
  end
  
  private

  def request_comment_params
    params.require(:request_comment).permit(:comment)
  end
end
