class PageDocumentsController < ApplicationController
  before_action :set_page_document, only: [:show, :edit, :update, :destroy]
layout 'home'
  # GET /page_documents
  # GET /page_documents.json
  def index
    @page_documents = PageDocument.all

  end

  # GET /page_documents/1
  # GET /page_documents/1.json
  def show
  end

  # GET /page_documents/new
  def new
    @page_document = PageDocument.new
  end

  # GET /page_documents/1/edit
  def edit
  end

  # POST /page_documents
  # POST /page_documents.json
  def create
    @page_document = PageDocument.new(page_document_params)

    respond_to do |format|
      if @page_document.save
        format.html { redirect_to @page_document, notice: 'Page document was successfully created.' }
        format.json { render :show, status: :created, location: @page_document }
      else
        format.html { render :new }
        format.json { render json: @page_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_documents/1
  # PATCH/PUT /page_documents/1.json
  def update
    respond_to do |format|
      if @page_document.update(page_document_params)
        format.html { redirect_to @page_document, notice: 'Page document was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_document }
      else
        format.html { render :edit }
        format.json { render json: @page_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_documents/1
  # DELETE /page_documents/1.json
  def destroy
    @page_document.destroy
    respond_to do |format|
      format.html { redirect_to page_documents_url, notice: 'Page document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_document
      @page_document = PageDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_document_params
      params.require(:page_document).permit(:name, :description, :user_id, :admin_user, :file)
    end
end
