require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { commute: @user.commute, interests: @user.interests, location: @user.location, name: @user.name, sleep_time: @user.sleep_time, wake_up_time: @user.wake_up_time, weather_sensitivity: @user.weather_sensitivity, work_schedule: @user.work_schedule } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { commute: @user.commute, interests: @user.interests, location: @user.location, name: @user.name, sleep_time: @user.sleep_time, wake_up_time: @user.wake_up_time, weather_sensitivity: @user.weather_sensitivity, work_schedule: @user.work_schedule } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
