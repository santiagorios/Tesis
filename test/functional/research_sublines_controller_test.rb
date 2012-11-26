require 'test_helper'

class ResearchSublinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get timeline" do
    get :timeline
    assert_response :success
  end

end
