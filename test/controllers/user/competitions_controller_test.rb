require 'test_helper'

class User::CompetitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_competitions_index_url
    assert_response :success
  end

  test "should get new" do
    get user_competitions_new_url
    assert_response :success
  end

  test "should get show" do
    get user_competitions_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_competitions_edit_url
    assert_response :success
  end

end
