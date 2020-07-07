require 'test_helper'

class Admin::RapsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_raps_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_raps_edit_url
    assert_response :success
  end

end
