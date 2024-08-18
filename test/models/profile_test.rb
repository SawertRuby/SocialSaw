require "test_helper"

class ProfileTest < ActiveSupport::TestCase

    setup do
        @profile  = profiles(:one)
      end
    
      test "should be valid" do
        assert @profile.valid?  
      end
    
      test "user should be present" do
        @profile.user = nil 
        assert_not @profile.valid?  
      end
      
      test "should update valid profile" do
        assert @profile.update(description: "Updated description")
      end
end
