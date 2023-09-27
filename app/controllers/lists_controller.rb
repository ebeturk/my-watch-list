class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def test
    @movies = Movie.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mark_movie_watched
    movie = Movie.find(params[:movie_id])
    @list = @list = List.find(params[:id])
    movie.update(watched: true)
    redirect_to list_path(@list), notice: 'Movie marked as watched!'
  end

  private

  def list_params
    params.require(:list).permit(:name, :movie_id)
  end
end
