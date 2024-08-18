require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @profile = profiles(:one)
    @post = posts(:one)
    sign_in @user
  end

  test "should like a post" do
    assert_difference('@post.like.count', 1) do
      post post_likes_path(@post), params: { post_id: @post.id, like_type: 1 }
    end
  end

  test "should dislike a post" do
    assert_difference('@post.like.count', 1) do
      post post_likes_path(@post), params: { post_id: @post.id, like_type: -1 }
    end
  end

  test "should remove like if already liked" do
    @post.like.create(profile: @profile, like_type: 1)
    assert_difference('@post.like.count', -1) do
      post post_likes_path(@post), params: { post_id: @post.id, like_type: 1 }
    end
  end

  test "should remove dislike if already disliked" do
    @post.like.create(profile: @profile, like_type: -1)
    assert_difference('@post.like.count', -1) do
      post post_likes_path(@post), params: { post_id: @post.id, like_type: -1 }
    end
  end
end
