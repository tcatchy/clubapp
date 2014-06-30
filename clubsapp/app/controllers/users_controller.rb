class UsersController < ApplicationController
  def admin
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
  end
end
