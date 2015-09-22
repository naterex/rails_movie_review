class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order('created_at DESC')
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params_movie)
    if @movie.save
      redirect_to @movie, notice: "Movie was successfully created"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @movie = Movie.update(params_movie)
    if @movie.save
      redirect_to @movie, notice: "Movie was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path, notice: "Movie was successfully deleted"
  end

  private

    def find_movie
      @movie = Movie.find(params[:id])
    end

    def params_movie
      params.require(:movie).permit(:title, :description, :director, :movie_length, :rating)
    end

end
