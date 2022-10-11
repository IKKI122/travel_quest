class Public::ReportsController < ApplicationController
  before_action :authenticate_user!
  def new
    @report = Report.new
    @request = Request.find(params[:request_id])
  end
  
  def create #依頼に対する報告を
    @request = Request.find(params[:request_id])
    @report = current_user.reports.new(report_params)
    @report.request_id = @request.id
    if @report.save
      redirect_to request_path(@request.id)
    else
      @request = Request.find(params[:request_id])
      render :new
    end
  end

  def edit
    @request = Request.find(params[:request_id])
    @report = Report.find(params[:id])
    unless @report.user == current_user
      redirect_to request_path(@request.id)
    end
  end
  
  def update
    @request = Request.find(params[:request_id])
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to request_path(@request.id)
    else
      render :edit
    end
  end
  
  def destroy
    @request = Request.find(params[:request_id])
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to request_path(@request.id)
  end
  
  private
  
  def report_params
    params.require(:report).permit(:user_id, :request_id, :report_sentence, report_images: [])
  end
end
