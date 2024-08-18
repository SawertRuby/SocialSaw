require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    sign_in @user
  end
  test "should get show" do
    get profile_url(@profile)
    assert_response :success
    assert_not_nil assigns(:profile)
  end

  test "should get new" do
    get edit_profile_url(@profile)
    assert_response :success
    assert_not_nil assigns(:profile)
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { username: 'Updated username', description: 'Updated description' } }
    assert_redirected_to profile_path(@profile)
    @profile.reload
    assert_equal 'Updated username', @profile.username
    assert_equal 'Updated description', @profile.description
  end
  
  

end
