class Admin::ReportCommentsController < ApplicationController
  def destroy
    ReportComment.find(params[:id]).destroy
    redirect_to admin_request_path(params[:request_id])
  end
  
  private

  def report_comment_params
    params.require(:report_comment).permit(:comment)
  end
end
