require 'test_helper'

class CityControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get city_name:string_url
    assert_response :success
  end

end
