class RepositoriesController < ApplicationController
  def index
    @results = GithubClient.new.repositories(search_query: params[:query])
    respond_to do |format|
      format.json { render json: @results }
    end
  end
end
