class RecipesController < ApplicationController
  before_action:set_recipe,only:[:edit,:update,:show,:destroy]
  # before_action :authenticate_user!, only: [:new, :create]
  def index
    @shops = Shop.all
    @recipes = Recipe.all
    @users = User.all
  if params[:q].present?
    @recipes = @search_recipes
  else
    @recipes = Recipe.all
  end
  end

  def new
    @shop = Shop.new
    recipe = @shop.recipes.build
    5.times{ recipe.materials.build }
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
  end

  def update
      if @recipe.update(recipe_params)
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
    params.require(:shop).permit(:id,:name,
        recipes_attributes: [:id,:name,:picture,:content,:curry_type,:user_id,:shop_id, :remove_picture,
        materials_attributes: [:id,:name,:amount,:recipe_id,:_destroy],
        flows_attributes: [:id,:content,:picture,:recipe_id,:_destroy, :remove_picture]]
      )
  end

  def recipe_params
    params.require(:recipe).permit(:id,:name,:picture,:content,:curry_type,:user_id,:shop_id, :remove_picture,
      materials_attributes: [:id,:name,:amount,:recipe_id,:_destroy],
      flows_attributes: [:id,:content,:picture,:recipe_id,:_destroy, :remove_picture]
    )
  end
end
