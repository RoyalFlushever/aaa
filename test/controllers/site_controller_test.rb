require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get site_landing_url
    assert_response :success
  end

end
