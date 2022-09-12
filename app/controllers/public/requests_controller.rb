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
      redirect_to new_request_path
    end
  end

  def show
    @request=Request.find(params[:id])
    @report=Report.new
    @reports=@request.reports
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  
  private
  
  def request_params
    params.require(:request).permit(:user_id, :area_id, :title, :request_sentence, :is_active)
  end
end
