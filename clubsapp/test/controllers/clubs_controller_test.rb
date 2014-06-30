require 'test_helper'

class ClubsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
