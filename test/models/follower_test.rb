require "test_helper"

class FollowerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @follower = followers(:one)  
  end
  test "followed should be present" do
    @follower.followed = nil  # Устанавливаем nil для followed
    assert_not @follower.valid?  # Проверяем, что объект не валиден без followed
  end
  test "should be valid" do
    assert @follower.valid?  
  end
  test "should not allow duplicate follower-followed pair" do
    duplicate_follower = @follower.dup
    assert_not duplicate_follower.valid?
  end

  test "should unfollow a profile" do
    assert_difference('Follower.count', -1) do
      @follower.destroy
    end
  end
end
