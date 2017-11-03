require 'test_helper'

class PageDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_document = page_documents(:one)
  end

  test "should get index" do
    get page_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_page_document_url
    assert_response :success
  end

  test "should create page_document" do
    assert_difference('PageDocument.count') do
      post page_documents_url, params: { page_document: { admin_user: @page_document.admin_user, description: @page_document.description, file: @page_document.file, name: @page_document.name, user_id: @page_document.user_id } }
    end

    assert_redirected_to page_document_url(PageDocument.last)
  end

  test "should show page_document" do
    get page_document_url(@page_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_document_url(@page_document)
    assert_response :success
  end

  test "should update page_document" do
    patch page_document_url(@page_document), params: { page_document: { admin_user: @page_document.admin_user, description: @page_document.description, file: @page_document.file, name: @page_document.name, user_id: @page_document.user_id } }
    assert_redirected_to page_document_url(@page_document)
  end

  test "should destroy page_document" do
    assert_difference('PageDocument.count', -1) do
      delete page_document_url(@page_document)
    end

    assert_redirected_to page_documents_url
  end
end
