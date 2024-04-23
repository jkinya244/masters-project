class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipes = @recipes.where('title ILIKE ?', "%#{params[:search]}%") if params[:search].present?
    @recipes = @recipes.order(params[:sort] ? params[:sort] : 'created_at DESC')
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

   def random_recipe
    @random_recipe = Recipe.order('RANDOM()').first
    if @random_recipe
      redirect_to recipe_path(@random_recipe)
    else
      redirect_to recipes_path, notice: 'No recipes found.'
    end
  end

  # New action for initializing a new recipe
  def new
    @recipe = Recipe.new
  end

  # Create action for saving the new recipe to the database
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  # Action to toggle favorite status of a recipe for the current user
  def toggle_favorite
    @recipe = Recipe.find(params[:id])
    if current_user.favorite_recipes.exists?(recipe_id: @recipe.id)
      current_user.favorite_recipes.destroy(@recipe)
      flash[:notice] = 'Recipe removed from favorites.'
    else
      current_user.favorite_recipes << @recipe
      flash[:notice] = 'Recipe added to favorites.'
    end
    redirect_to @recipe
  end
  end

  private
  # Strong parameters to prevent mass assignment vulnerabilities
  def recipe_params
    params.require(:recipe).permit(:title, :cuisine, :meal_type, :cooking_instructions)
  end
end

