require "test_helper"

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
  @user = users(:one)
  @profile = profiles(:one)
  following_ids = @profile.following.pluck(:followed_id)
  @posts = Post.where(profile_id: following_ids)
  sign_in @user
  end
  test "should show posts from followed profiles" do
    get subscription_path(@profile)
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
