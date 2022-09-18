class Public::ReportLikesController < ApplicationController
  def create
    report=Report.find(params[:report_id])
    report_like=current_user.report_likes.new(report_id: report.id)
    report_like.save
    redirect_to request_path(report.request.id)
  end
  
  def destroy
    report=Report.find(params[:report_id])
    report_like=current_user.report_likes.find_by(report_id: report.id)
    report_like.destroy
    redirect_to request_path(report.request.id)
  end
end
