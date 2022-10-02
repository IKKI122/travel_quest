class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  
  def top
    @request=Request.new
    @requests=Request.order('id DESC').limit(4)
  end
end
