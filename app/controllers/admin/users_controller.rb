class Admin::UsersController < ApplicationController
  def index
    @users=User.page(params[:page])
  end

  def show
  end
  
  def update
  end 
end
