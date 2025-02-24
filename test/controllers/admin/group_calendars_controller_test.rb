require "test_helper"

class Admin::GroupCalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_group_calendars_show_url
    assert_response :success
  end
end
