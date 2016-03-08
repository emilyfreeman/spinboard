class LoginTest < ActionDispatch::IntegrationTest
  test "visitor can see login link" do
    visit root_path

    assert page.has_content?("Sign In")
    assert page.has_content?("Sign Up")
  end

  test "visitor can create account and sign in" do
    visit root_path

    click_link "Sign Up"

    fill_in "Email", with: "emily@emilydowdle.com"
    fill_in "Password", with: "password"
    fill_in "Confirm password", with: "password"
    click_button "Create Account"

    assert_equal '/', current_path

  end

  test "visitor can cannot create account with unmatched passwords" do
    visit root_path

    click_link "Sign Up"

    fill_in "Email", with: "emily@emilydowdle.com"
    fill_in "Password", with: "password"
    fill_in "Confirm password", with: "password1"
    click_button "Create Account"

    assert_equal '/users', current_path
  end

  test "visitor can cannot create account with missing confirmation password" do
    visit root_path

    click_link "Sign Up"

    fill_in "Email", with: "emily@emilydowdle.com"
    fill_in "Password", with: "password"
    fill_in "Confirm password", with: ""
    click_button "Create Account"

    assert_equal '/users', current_path
  end

  test "user can login" do
    User.create(email: "emily@emilydowdle.com",
                password: "password")

    visit root_path

    click_link "Sign In"
    fill_in "Email", with: "emily@emilydowdle.com"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal root_path, current_path
    refute page.has_content?("Sign In")
    refute page.has_content?("Sign Up")
    assert page.has_content?("Sign Out")
  end

end
