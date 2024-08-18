require "test_helper"

class FollowersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @profile_to_follow = profiles(:two)
    @profile_to_unfollow = profiles(:three)
    sign_in @user
  end
  test "should follow a profile" do
    assert_difference('Follower.count', 1) do
      post profile_followers_path(@profile_to_follow)
    end

    assert_redirected_to @profile_to_follow
    assert_equal 'Successfully followed!', flash[:notice]
  end

  test "should unfollow a profile" do
    @user.profile.follow(@profile_to_unfollow)

    assert_difference('Follower.count', -1) do
      delete profile_followers_path(@profile_to_unfollow)
    end

    assert_redirected_to @profile_to_unfollow
    assert_equal 'Successfully unfollowed!', flash[:notice]
  end
end
