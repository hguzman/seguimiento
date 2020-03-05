require 'test_helper'

class AnotacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anotaciones_index_url
    assert_response :success
  end

end
