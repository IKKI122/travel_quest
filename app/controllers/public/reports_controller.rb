class Public::ReportsController < ApplicationController
  def index
  end

  def new
    @report=Report.new
    @request=Request.find(params[:request_id])
  end
  
  def create
    request=Request.find(params[:request_id])
    report=current_user.reports.new(report_params)
    report.request_id=request.id
    if report.save
      redirect_to request_path(request.id)
    else
      render :new
    end
  end

  def edit
    @request=Request.find(params[:request_id])
    @report=Report.find(params[:id])
    unless @report.user==current_user
      redirect_to request_path(@request.id)
    end
  end
  
  def update
    @request=Request.find(params[:request_id])
    @report=Report.find(params[:id])
    if @report.update(report_params)
      redirect_to request_path(@request.id)
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  
  def report_params
    params.require(:report).permit(:report_sentence, report_images: [])
  end
end
