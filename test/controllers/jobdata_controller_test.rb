require 'test_helper'

class JobdataControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get computer" do
    get :computer
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
