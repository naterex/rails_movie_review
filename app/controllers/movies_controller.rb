class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params_movie)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def find_movie
      @movie = Movie.find(params[:id])
    end

    def params_movie
      params.require(:movie).permit(:title, :description, :director, :movie_length, :rating)
    end

end
