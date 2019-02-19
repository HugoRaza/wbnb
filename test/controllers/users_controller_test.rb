require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get owner_dashboard" do
    get users_owner_dashboard_url
    assert_response :success
  end

end
