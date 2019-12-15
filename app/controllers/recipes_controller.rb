class RecipesController < ApplicationController
  before_action:set_recipe,only:[:edit,:update,:show,:destroy]
  before_action:set_shop,only:[:edit,:update,:show,:destroy]
  # before_action :authenticate_user!, only: [:show]

  def index
    if @search_recipes.present?
    @recipes =  @search_recipes.updated
  elsif @search_recipes.blank?
    redirect_to recipes_path, notice: '該当なし'
  else
    @recipes =  Recipe.all.updated
  end
  end

  def new
    @recipe = Recipe.new
    @shop = Shop.new
    recipe = @shop.recipes.build
    5.times{ recipe.materials.build}
    5.times{ recipe.flows.build }
  end

  def create
      shop = Shop.new(shop_params)
    if  shop.save
      redirect_to recipes_path ,notice:'成功'
    else
      render 'new',notice:'失敗'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def edit
    # @shop = Shop.find(@recipe.shop_id)
  end

  def update
    if @shop.update(shop_params)
      redirect_to recipes_path,notice:"編集しました"
    else
      render 'edit'
    end
  end

  def show
    @favorite = current_user.recipe_likes.find_by(recipe_id: @recipe.id)
    @comment = @recipe.comments.build
    @comments = @recipe.comments
  end

  private
  def shop_params
    params.require(:shop).permit(:id,:name,:recipe_id,
        recipes_attributes: [:id,:name,:picture,:content,:curry_type,:user_id,:shop_id, :remove_picture],
        materials_attributes: [:id,:name,:amount,:recipe_id,:_destroy],
        flows_attributes: [:id,:content,:picture,:recipe_id,:_destroy, :remove_picture]
      )
  end


end
