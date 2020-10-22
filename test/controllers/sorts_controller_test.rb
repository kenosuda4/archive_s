require 'test_helper'

class SortsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sorts_index_url
    assert_response :success
  end

end
