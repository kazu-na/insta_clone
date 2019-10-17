require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Instagram Clone"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get top" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

end
