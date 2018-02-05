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
    @list.tasks.build
  end

  def create
    list = List.new(list_params)

    if list.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:task, :_destroy])
  end
end
