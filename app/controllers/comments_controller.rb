class CommentsController < ApplicationController
def create
  @recipe = Recipe.find(params[:recipe_id])
  @comment = @recipe.comments.build(comment_params)
  @comment.user_id = current_user.id

  respond_to do |format|
    if @comment.save
      format.js { render :index }
    else
      format.html { redirect_to recipe_path(@recipe), notice: 'コメント投稿失敗' }
    end
  end
end

def destroy
  @comment =  Comment.find(params[:id])
  @comment.destroy
  render :index, notice: 'コメントを削除しました'
end

  private
  def comment_params
    params.require(:comment).permit(:recipe_id, :user_id, :content)
  end
end
