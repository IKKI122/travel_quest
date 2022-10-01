class Admin::RequestsController < ApplicationController
  def index
    @request=Request.new
    @requests=Request.page(params[:page])
    @areas=Area.all
  end

  def show
    @request=Request.find(params[:id])
    @reports=@request.reports
    @request_comment=RequestComment.new
    @report_comment=ReportComment.new
  end
  
  def destroy
    @request=Request.find(params[:id])
    @request.destroy
    redirect_to admin_requests_path
  end
  
  private
  
  def request_params
    params.require(:request).permit(:user_id, :area_id, :title, :request_sentence, :is_active)
  end
end
