class RecipesController < ApplicationController
   require 'will_paginate/array'
  def index
      @search = params[:search]
      @recipes = Recipe.for(@search) or  Recipe.for('chocolate')
      @counter = Recipe.for(@search).count() ||  Recipe.for('chocolate').count()
      @recipes =@recipes.paginate(:page=>params[:page],:per_page=>10)
  end
end
