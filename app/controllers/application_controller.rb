class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def self.search(search)
    if search
      where(['adress LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  before_action :set_search
  def set_search
    @q = Room.ransack(params[:q])
    @mains = @q.result(distinct: true)
  end

  private
  def afeter_sign_in_path_for(resource)
    mains_index_path(resource)
  end
  
  # def afeter_out_in_path_for(resource)
  #   new_user_session_path
  # end

end
