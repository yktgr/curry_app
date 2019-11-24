class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Recipe.ransack(params[:q]||{curry_type_in: Recipe.curry_types.values})
    @search_recipes = @search.result(distinct: true)
  end
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
