class Public::RequestsController < ApplicationController
  def index
  end

  def new
    @request=Request.new
    @areas=Area.all
  end
  
  def create
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
