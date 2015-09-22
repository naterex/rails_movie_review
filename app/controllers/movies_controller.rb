class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all.order('created_at DESC')
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(params_movie)
    if @movie.save
      redirect_to @movie, success: "Movie was successfully created"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.save
      redirect_to @movie, alert: "Movie was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path, error: "Movie was successfully deleted"
  end

  private

    def find_movie
      @movie = Movie.find(params[:id])
    end

    def params_movie
      params.require(:movie).permit(:title, :description, :director, :movie_length, :rating)
    end

end
