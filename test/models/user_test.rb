require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user with title and password" do
    user = User.create(email: "email@emily.com", password: "password")
    assert user.valid?
  end

  test "cannot create user without email" do
    user = User.create(password: "password")
    refute user.valid?
  end

  test "cannot create user without password" do
    user = User.create(email: "email@emily.com")
    refute user.valid?
  end

  test "user can have many links" do
    user = User.create!(email: "email@emily.com", password: "password")
    user.links.create!(title: "wahoo", url: "http://google.com")

    assert_equal user.links.count, 1
  end
end
