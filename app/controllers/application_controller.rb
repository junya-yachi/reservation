class ApplicationController < ActionController::Base
  include UsersHelper

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

  
  private

  def set_search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def afeter_sign_in_path_for(resource)
    mains_path(resource)
  end
  
  # def afeter_out_in_path_for(resource)
  #   new_user_session_path
  # end

end
