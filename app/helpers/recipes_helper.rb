module RecipesHelper
  def choose_new_or_edit
    if action_name == 'new'
      recipes_path
    elsif action_name == 'edit'
      recipe_path
    end
  end
end
