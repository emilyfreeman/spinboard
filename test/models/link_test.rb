require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "can create link with title and url" do
    link = Link.create(title: "Thing", url: "http://google.com")
    assert link.valid?
  end

  test "link defaults read value to false" do
    link = Link.create(title: "Thing", url: "http://google.com")
    assert_equal link.read?, false
  end

  test "cannot create link without title" do
    link = Link.create(url: "http://google.com")
    refute link.valid?
  end

  test "cannot create link without url" do
    link = Link.create(title: "thing")
    refute link.valid?
  end

  test "cannot create link without valid url" do
    link = Link.create(title: "thing", url: "wrong!")
    refute link.valid?
  end
end
