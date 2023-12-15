class BookmarksController < ApplicationController
  def new
    @list = List.find(params["list_id"])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params["list_id"])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def destroy
    @bookmark = List.destroy(params[:id])
  end
end
