class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_search
    @q = Recipe.ransack(params[:q])
    @result =  @q.result(distinct: true).order(created_at: :desc)
    @recipes =  @result
  end

  def after_sign_in_path_for(resource)
    recipes_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_url
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
