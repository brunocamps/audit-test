require "test_helper"

class CompanyAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_area = company_areas(:one)
  end

  test "should get index" do
    get company_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_company_area_url
    assert_response :success
  end

  test "should create company_area" do
    assert_difference("CompanyArea.count") do
      post company_areas_url, params: { company_area: { name: @company_area.name } }
    end

    assert_redirected_to company_area_url(CompanyArea.last)
  end

  test "should show company_area" do
    get company_area_url(@company_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_area_url(@company_area)
    assert_response :success
  end

  test "should update company_area" do
    patch company_area_url(@company_area), params: { company_area: { name: @company_area.name } }
    assert_redirected_to company_area_url(@company_area)
  end

  test "should destroy company_area" do
    assert_difference("CompanyArea.count", -1) do
      delete company_area_url(@company_area)
    end

    assert_redirected_to company_areas_url
  end
end
