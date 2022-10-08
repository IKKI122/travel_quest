class Public::ReportCommentsController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @report_comment = @report.report_comments.new(report_comment_params)
    @report_comment.user_id = current_user.id
    @report_comment.save
    redirect_to request_path(params[:request_id])
  end
  
  def destroy
    ReportComment.find(params[:id]).destroy
    redirect_to request_path(params[:request_id])
  end
  
  private

  def report_comment_params
    params.require(:report_comment).permit(:comment)
  end
end
