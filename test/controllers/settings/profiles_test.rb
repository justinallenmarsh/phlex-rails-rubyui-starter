# frozen_string_literal: true

require "test_helper"

class Settings::ProfilesTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as @user
  end

  test "GET /settings/profile returns success" do
    get settings_profile_url
    assert_response :success
  end

  test "PATCH /settings/profile with valid name updates profile" do
    patch settings_profile_url, params: {
      name: "New Name"
    }
    assert_redirected_to settings_profile_path
    assert_equal "Your profile has been updated", flash[:notice]
  end

  test "PATCH /settings/profile with readonly user shows error" do
    @user.update!(email: "me@example.com")

    patch settings_profile_url, params: { name: "New Name" }

    assert_redirected_to settings_profile_path
    assert_equal "User is marked as readonly.", flash[:alert]
  end
end
