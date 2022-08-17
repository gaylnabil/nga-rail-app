require "test_helper"

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registration_index_url
    assert_response :success
  end

  test "should get create" do
    get registration_create_url
    assert_response :success
  end
end
