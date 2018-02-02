class ListsController < ApplicationController
  # before_action :list_params
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)

    if list.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:task])
  end
end
