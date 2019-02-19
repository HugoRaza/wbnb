require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get rentals_create_url
    assert_response :success
  end

  test "should get index" do
    get rentals_index_url
    assert_response :success
  end

  test "should get show" do
    get rentals_show_url
    assert_response :success
  end

  test "should get update" do
    get rentals_update_url
    assert_response :success
  end

end
