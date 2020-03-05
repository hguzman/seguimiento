require 'test_helper'

class Users::AnotacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_anotaciones_index_url
    assert_response :success
  end

end
