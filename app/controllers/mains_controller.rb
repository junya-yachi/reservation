class MainsController < ApplicationController
  def index
    # @users = User.find(params[:id])
    
    
    @user = current_user.image
    
  end
end
