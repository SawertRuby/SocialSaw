require "test_helper"

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:one)  
    @post = posts(:one)
  end

  test "should be valid" do
    assert @comment.valid?  
  end

  test "post should be present" do
    @comment.post = nil 
    assert_not @comment.valid?  
  end

  test "profile should be present" do
    @comment.profile = nil  
    assert_not @comment.valid? 
  end

  test "should soft delete comment" do
    assert_nil @comment.deleted_at 
    @comment.soft_delete  
    assert_not_nil @comment.reload.deleted_at 
  end
  test "should save valid comment" do
    comment = Comment.new(title: "Valid title", profile: @post.profile, post: @post )
    assert comment.save
  end
end
