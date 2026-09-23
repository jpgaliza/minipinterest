require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "username is required" do
    user = User.new(email: "new@example.com", password: "password")

    assert_not user.valid?
    assert_includes user.errors[:username], "can't be blank"
  end

  test "username must be unique regardless of case" do
    user = User.new(email: "new@example.com", password: "password", username: "USERONE")

    assert_not user.valid?
    assert_includes user.errors[:username], "has already been taken"
  end

  test "username cannot contain spaces" do
    user = User.new(email: "new@example.com", password: "password", username: "user name")

    assert_not user.valid?
    assert_includes user.errors[:username], "não pode conter espaços"
  end
end
