class Public::RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  
  def index
    @request = Request.new
    @requests = Request.page(params[:page])
    @q = Request.ransack(params[:q]) #送られてきたパラメーターを元にテーブルからデータを検索
    @areas = Area.all #目的地の都道府県を取得
  end

  def new
    @request = Request.new
    @areas = Area.all
  end
  
  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to requests_path
    else
      @areas = Area.all
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
    unless @request.user.is_deleted == false #依頼ユーザーが退会済みの場合は依頼一覧に遷移
      redirect_to requests_path
    end
    @reports = @request.reports #依頼に対する報告を取得
    @request_comment = RequestComment.new 
    @report_comment = ReportComment.new
  end

  def edit
    @request = Request.find(params[:id])
    @areas = Area.all
    unless @request.user == current_user
      redirect_to request_path(request.id)
    end
  end
  
  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to request_path(@request.id)
    else
      render :edit
    end
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end
  
  def search #検索結果の一覧表示
    @q = Request.ransack(params[:q]) #送られてきたパラメーターを元にテーブルからデータを検索
    @results = @q.result(distinct: true) #distinct: trueで重複したデータを除外
  end
  private
  
  def request_params
    params.require(:request).permit(:user_id, :area_id, :title, :request_sentence, :is_active)
  end
end
