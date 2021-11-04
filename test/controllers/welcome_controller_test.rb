require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get bonjour_name" do
    get welcome_bonjour_name_url
    assert_response :success
  end

end
