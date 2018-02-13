class DocumentsController < ApplicationController
  def index
    @docs = Document.all
  end

  def show
    @doc = Document.find(params[:id])
    send_file @doc.doc_file.path
  end

  def new
    @doc = Document.new
  end

  def create
    @doc = Document.new(doc_params)
    if @doc.save
      redirect_to document_path(@doc)
    else
      render 'new'
    end
  end

  def destroy
    @doc = Document.find(params[:id])
    @doc.destroy
    redirect_to documents_path
  end

  private

  def doc_params
    params.require(:document).permit(:name, :doc_file)
  end
end
