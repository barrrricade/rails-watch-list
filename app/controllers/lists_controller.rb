class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]
  # before_action :set_bookmark, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @bookmark.list = @list

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'list was successfully created.'
    else
      render :new
    end
  end



  private

  def set_list
    @list = List.find(params[:id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end


end
