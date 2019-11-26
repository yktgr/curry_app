class RecipesController < ApplicationController
  before_action:set_recipe,only:[:edit,:update,:show,:destroy]
  # before_action :authenticate_user!, only: [:new, :create]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    5.times{ @recipe.materials.build }
    5.times{ @recipe.flows.build }
  end

  def create
      # @recipe = Shop.new(shop_params)
    @recipe = Recipe.new(recipe_params)
    # if  @shop.save
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
  # def shop_params
  #   params.require(:shop).permit(:name,
  #       recipes_attributes: [:name,:picture,:content,:curry_type,:user_id,:shop_id,
  #       materials_attributes: [:name,:amount,:recipe_id,:_destroy],
  #       flows_attributes: [:content,:picture,:recipe_id,:_destroy]]
  #     )
  # end

  def recipe_params
    params.require(:recipe).permit(:name,:picture,:content,:curry_type,:user_id,:shop_id,
      materials_attributes: [:name,:amount,:recipe_id,:_destroy],
      flows_attributes: [:content,:picture,:recipe_id,:_destroy]
    )
  end
end
