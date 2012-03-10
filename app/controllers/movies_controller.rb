class MoviesController < ApplicationController
  def initialize()
    super
    @table_classes = {}
  end


  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.order(params[:sort]).all
    @table_classes[params[:sort]] = 'hilite' if params[:sort]
    # @title_class = @release_class = nil
    # if params[:sort] == 'title' then
    #   @movies.sort! {|x, y| x.title.to_s <=> y.title.to_s}
    #   @title_class = 'hilite'
    # end
    # if params[:sort] == 'release_date' then
    #   @movies.sort! {|x, y| x.release_date <=> y.release_date}
    #   @release_class = 'hilite'
    # end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
