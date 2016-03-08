class LoginTest < ActionDispatch::IntegrationTest
  test "user can login and see links index" do
    user = User.create!(email: "emily@emilydowdle.com",
                        password: "password")

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: "emily@emilydowdle.com"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal root_path, current_path
    assert page.has_content?("Title")
    assert page.has_content?("Url")
    assert page.has_button?("Add Link")
    assert page.has_button?("Filter List By Status")
    assert page.has_button?("Filter List Alphabetically")
  end
end
