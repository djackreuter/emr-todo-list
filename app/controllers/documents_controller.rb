class DocumentsController < ApplicationController
  def index
    @docs = Document.all
  end

  def show
    @doc = Document.find(params[:id])
  end
end
