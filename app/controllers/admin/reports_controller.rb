class Admin::ReportsController < ApplicationController
  def destroy
    @request = Request.find(params[:request_id])
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to admin_request_path(@request.id)
  end
end
