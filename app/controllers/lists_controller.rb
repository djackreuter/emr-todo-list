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

  def edit
    @list = List.find(params[:id])
  end

  def create
    list = List.new(list_params)

    if list.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:id, :task, :_destroy])
  end
end
