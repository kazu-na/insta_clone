require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/top'
    assert_select "a[href=?]", root_path

    # get contact_path
    # assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "layout links when logged in" do                                         # ホームページ用の統合テスト
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/top'
    assert_select "a[href=?]", root_path
  end
end
