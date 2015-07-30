require 'test_helper'

class SubRedditsControllerTest < ActionController::TestCase
  test "should get hot_reddit" do
    get :hot_reddit
    assert_response :success
  end

  test "should get nasty_reddit" do
    get :nasty_reddit
    assert_response :success
  end

end
