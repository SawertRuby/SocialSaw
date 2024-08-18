require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    @post = posts(:one)
    sign_in @user
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get show" do
    get post_url(@post)
    assert_response :success
    assert_not_nil assigns(:post)
    assert_not_nil assigns(:comments)
    assert_not_nil assigns(:comment)
    assert_not_nil assigns(:likes_count)
    assert_not_nil assigns(:dislikes_count)
  end

  test "should get new" do
    get new_post_url
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { description: 'New Post', images: [] } }
    end

    assert_redirected_to profile_url(@profile)
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "should update post" do
    patch post_url(@post), params: { post: { description: 'Updated description' } }
    assert_redirected_to post_url(@post)
    @post.reload
    assert_equal 'Updated description', @post.description
  end

  test "should not update post if unauthorized" do
    other_profile = profiles(:one)
    other_post = posts(:two)
    sign_in users(:one)
    patch post_url(other_post), params: { post: { description: 'Updated description' } }
    assert_redirected_to post_url(other_post)
    assert_equal 'You are not authorized to edit this post.', flash[:alert]
  end
  

  
end
