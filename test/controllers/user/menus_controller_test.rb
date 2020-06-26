require 'test_helper'

class User::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_menus_index_url
    assert_response :success
  end

  test "should get new" do
    get user_menus_new_url
    assert_response :success
  end

  test "should get show" do
    get user_menus_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_menus_edit_url
    assert_response :success
  end

end
