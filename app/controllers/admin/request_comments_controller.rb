class Admin::RequestCommentsController < ApplicationController
  def destroy
    RequestComment.find(params[:id]).destroy
    redirect_to request_path(params[:request_id])
  end
  
  
end
