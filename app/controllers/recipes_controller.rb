class RecipesController < ApplicationController
  before_action:set_recipe,only:[:edit,:update,:show,:destroy]
  # before_action:set_shop,only:[:edit,:update,:show,:destroy]
  # before_action :authenticate_user!, only: [:new, :create]

  def index
    if @search_recipes == nil
      @recipes =  Recipe.all.updated
      redirect_to recipes_path, notice: '該当なし'
    else
    @recipes = @search_recipes.updated
    end
    @recipes =  Recipe.all.updated
end


  def new
    @recipe = Recipe.new
    0.times{ @recipe.materials.build}
    0.times{ @recipe.flows.build }
  end

  def create
      shop = Shop.find(params[:shop_id])
      shop.recipes.build(recipe_params) if params[:shop_id].present?
      @recipe = Recipe.new(recipe_params)
    if  @recipe.save

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
  def recipe_params
    params.require(:recipe).permit(:id,:name,:picture,:content,:curry_type,:user_id,:shop_id, :remove_picture,
        materials_attributes: [:id,:name,:amount,:recipe_id,:_destroy],
        flows_attributes: [:id,:content,:picture,:recipe_id,:_destroy, :remove_picture]
      )
  end


end
