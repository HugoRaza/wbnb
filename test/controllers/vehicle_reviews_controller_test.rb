require 'test_helper'

class VehicleReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get vehicle_reviews_create_url
    assert_response :success
  end

end
