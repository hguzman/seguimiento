require 'test_helper'

class EspecialidadesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get especialidades_index_url
    assert_response :success
  end

  test "should get show" do
    get especialidades_show_url
    assert_response :success
  end

  test "should get new" do
    get especialidades_new_url
    assert_response :success
  end

  test "should get create" do
    get especialidades_create_url
    assert_response :success
  end

  test "should get edit" do
    get especialidades_edit_url
    assert_response :success
  end

  test "should get update" do
    get especialidades_update_url
    assert_response :success
  end

end
