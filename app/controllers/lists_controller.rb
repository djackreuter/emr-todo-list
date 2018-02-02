class ListsController < ApplicationController
  before_action :list_params
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = lists.build
  end

  def create
    @list = lists.build(list_params)

    if @list.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
