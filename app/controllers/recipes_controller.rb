class RecipesController < ApplicationController
  before_action:set_recipe,only:[:edit,:update,:show,:destroy]
  # before_action :authenticate_user!, only: [:new, :create]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.materials.build
    @recipe.flows.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
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
  def recipe_params
    params.require(:recipe).permit(:name,:picture,:content,:curry_type,:user_id,
      materials_attributes: [:name,:amount,:recipe_id,:_destroy],
      flows_attributes: [:content,:picture,:recipe_id,:_destroy]
    )
  end


end
