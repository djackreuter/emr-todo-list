class TasksController < ApplicationController
  def create
    @list = List.find(params[:id])
    @task = @list.tasks.create(task_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@list)
  end

  private

  def task_params
    params.require(:task).permit(:task)
  end
end
