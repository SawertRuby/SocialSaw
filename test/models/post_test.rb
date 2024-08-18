require "test_helper"

class PostTest < ActiveSupport::TestCase
    setup do
        @post = posts(:one)  
      end
    
      test "should be valid" do
        assert @post.valid?  
      end
    
     
    
      test "profile should be present" do
        @post.profile = nil  
        assert_not @post.valid? 
      end
    
      test "should save valid post" do
        post = Post.new(description: "Valid description", profile: @post.profile)
        assert post.save
      end
    
     
    
      
end




