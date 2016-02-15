require 'test_helper'

class FriendshipManagementControllerTest < ActionController::TestCase
  test "should get add_friends" do
    get :add_friends
    assert_response :success
  end

  test "should get manage_friend_requests" do
    get :manage_friend_requests
    assert_response :success
  end

  test "should get my_friends" do
    get :my_friends
    assert_response :success
  end

end
