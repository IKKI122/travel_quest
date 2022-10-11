class Admin::RequestsController < ApplicationController
  def index
    @request = Request.new
    @requests = Request.page(params[:page])
    @areas = Area.all #目的地の都道府県を取得
  end

  def show
    @request = Request.find(params[:id])
    @reports = @request.reports
    @request_comment = RequestComment.new #依頼に対するコメント
    @report_comment = ReportComment.new #報告に対するコメント
  end
  
  def destroy
    @request =Request.find(params[:id])
    @request.destroy
    redirect_to admin_requests_path
  end
  
  private
  
  def request_params
    params.require(:request).permit(:user_id, :area_id, :title, :request_sentence, :is_active)
  end
end
