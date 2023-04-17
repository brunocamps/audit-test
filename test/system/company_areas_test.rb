require "application_system_test_case"

class CompanyAreasTest < ApplicationSystemTestCase
  setup do
    @company_area = company_areas(:one)
  end

  test "visiting the index" do
    visit company_areas_url
    assert_selector "h1", text: "Company Areas"
  end

  test "creating a Company area" do
    visit company_areas_url
    click_on "New Company Area"

    fill_in "Name", with: @company_area.name
    click_on "Create Company area"

    assert_text "Company area was successfully created"
    assert_selector "h1", text: "Company Areas"
  end

  test "updating a Company area" do
    visit company_area_url(@company_area)
    click_on "Edit", match: :first

    fill_in "Name", with: @company_area.name
    click_on "Update Company area"

    assert_text "Company area was successfully updated"
    assert_selector "h1", text: "Company Areas"
  end

  test "destroying a Company area" do
    visit edit_company_area_url(@company_area)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Company area was successfully destroyed"
  end
end
