class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  
  def index
    @movies = Movie.all
  end

 
  def show
  end


  def new
    @movie = current_user.movies.build
  end


  def edit
  end


  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      redirect_to movie_path(@movie), notice: 'You have seccessfully created a movie!!'
    else
      render :new
    end
  end

    


  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.' 
     else
      render :edit 
    
     end
   end


  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end


    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :rated, :director, :image)
    end
end
