class RrmController < ApplicationController

  layout 'application'

  def index
    @recipes_count = Recipe.find(:all).length
  end

end
