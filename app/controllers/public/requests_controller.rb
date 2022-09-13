class Public::RequestsController < ApplicationController
  def index
    @request=Request.new
    @requests=Request.page(params[:page])
  end

  def new
    @request=Request.new
    @areas=Area.all
  end
  
  def create
    @request=Request.new(request_params)
    @request.user_id=current_user.id
    if @request.save
      redirect_to requests_path
    else
      @requests=Request.all
      render :new
    end
  end

  def show
    @request=Request.find(params[:id])
    @report=Report.new
    @reports=@request.reports
  end

  def edit
    @request=Request.find(params[:id])
    @areas=Area.all
    unless @request.user==current_user
      redirect_to request_path(request.id)
    end
  end
  
  def update
    @request=Request.find(params[:id])
    if @request.update(request_params)
      redirect_to request_path(@request.id)
    else
      render :edit
    end
  end
  
  def destroy
    @request=Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end
  
  
  private
  
  def request_params
    params.require(:request).permit(:user_id, :area_id, :title, :request_sentence, :is_active)
  end
end
