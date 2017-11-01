class RecipesController < ApplicationController

  def index()
    @search = params[:search]
    @recipes = Recipe.for(@search)|| Recipe.for('chocolate')
  end
end
