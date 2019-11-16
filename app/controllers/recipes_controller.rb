class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path ,notice:'成功'
    else
      render 'new',notice:'失敗'
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name,:picture,:content,:curry_type)
  end
end
