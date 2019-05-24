require 'test_helper'

class UsercompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get usercompanies_index_url
    assert_response :success
  end

  test "should get show" do
    get usercompanies_show_url
    assert_response :success
  end

  test "should get new" do
    get usercompanies_new_url
    assert_response :success
  end

  test "should get create" do
    get usercompanies_create_url
    assert_response :success
  end

  test "should get edit" do
    get usercompanies_edit_url
    assert_response :success
  end

  test "should get update" do
    get usercompanies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get usercompanies_destroy_url
    assert_response :success
  end

end
