class CommentsController < ApplicationController
before_action:set_comment,only:[:edit,:update,:destroy]
before_action :authenticate_user!, only: [:index, :new, :create]
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.user_id = current_user.id
    @recipe = @comment.recipe_id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { render :index }
      end
    end
  end

  def destroy
    @comment =  Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  def edit
    redirect_to recipes_path unless current_user.id == @comment.user_id
  end


  def update
    if @comment.update(comment_params)
      render 'index'
    else
      render 'index'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:recipe_id, :user_id, :content)
  end
end
