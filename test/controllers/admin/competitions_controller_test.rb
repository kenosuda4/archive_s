require 'test_helper'

class Admin::CompetitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_competitions_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_competitions_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_competitions_edit_url
    assert_response :success
  end

end
