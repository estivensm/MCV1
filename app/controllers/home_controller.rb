class HomeController < ApplicationController

layout 'home'

  def index
  	 @page_documents = PageDocument.all
  end
end
