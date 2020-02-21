require 'test_helper'

class FichasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fichas_index_url
    assert_response :success
  end

  test "should get show" do
    get fichas_show_url
    assert_response :success
  end

  test "should get new" do
    get fichas_new_url
    assert_response :success
  end

  test "should get create" do
    get fichas_create_url
    assert_response :success
  end

  test "should get edit" do
    get fichas_edit_url
    assert_response :success
  end

  test "should get update" do
    get fichas_update_url
    assert_response :success
  end

end
