require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @profile = profiles(:one)
    @post = posts(:one)
    @comment = comments(:one)
    sign_in @user
  end

  test "should create comment" do
    assert_difference('@post.comment.count') do
      post post_comments_url(@post), params: { comment: { title: 'New Comment', images: [] } }
    end

    assert_redirected_to @post
    assert_equal 'Comment was successfully created.', flash[:notice]
  end

  test "should not destroy comment if unauthorized" do
    other_comment = comments(:two)
    sign_in users(:two)
    
    assert_no_difference('@post.comment.count') do
      delete post_comment_url(@post, other_comment)
    end
  end
end
