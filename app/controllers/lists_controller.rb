class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @review = Review.new
  end

  def new
    @lists = List.new
  end

  def create
    @lists = List.new(list_params)
    @lists.save
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
