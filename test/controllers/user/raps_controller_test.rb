require 'test_helper'

class User::RapsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_raps_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_raps_edit_url
    assert_response :success
  end

end
