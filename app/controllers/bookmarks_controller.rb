class BookmarksController < ApplicationController

    before_action :set_bookmark, only: [:destroy]
    before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new

  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save

      redirect_to list_path(@list), notice: 'bookmark was successfully created.'
    else

      render :new
    end
  end

  def destroy
    @bookmark.destroy
    # @bookmark.list = @list
    redirect_to list_path(@bookmark.list), notice: 'bookmark was successfully destroyed.'
  end


  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
