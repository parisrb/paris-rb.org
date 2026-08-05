require "test_helper"

class LocalesControllerTest < ActionDispatch::IntegrationTest
  test "redirects back to the referer without the locale param" do
    patch locale_path, headers: { "Referer" => "http://www.example.com/talks?locale=en" }

    assert_redirected_to "http://www.example.com/talks"
  end

  test "falls back to root when there is no referer" do
    patch locale_path

    assert_redirected_to root_path
  end

  # The Referer header is client controlled. Under Rails 8.1 defaults a
  # path-relative redirect target raises PathRelativeRedirectError, so an
  # unusable referer must fall back rather than reach redirect_to.
  test "falls back to root for a path relative referer" do
    patch locale_path, headers: { "Referer" => "talks/foo" }

    assert_redirected_to root_path
  end
end
