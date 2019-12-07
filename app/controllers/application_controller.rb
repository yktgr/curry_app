class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  before_action :set_search


  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_url
  end

  def set_search
   @search = Recipe.ransack(params[:q]||{curry_type_in: Recipe.curry_types.values})
   @search_recipes = @search.result(distinct: true)
 end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
