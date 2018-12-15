class PagesController < ApplicationController
  def home
    @skills = Skill.pluck(:name).sort
  end

  def autocomplete
    results = AutocompleteSearchService.new(params[:q]).call
    render json: results
  end
end
