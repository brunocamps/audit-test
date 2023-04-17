require "application_system_test_case"

class EvaluationsTest < ApplicationSystemTestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "visiting the index" do
    visit evaluations_url
    assert_selector "h1", text: "Evaluations"
  end

  test "creating a Evaluation" do
    visit evaluations_url
    click_on "New Evaluation"

    fill_in "Company area", with: @evaluation.company_area_id
    fill_in "Name", with: @evaluation.name
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    assert_selector "h1", text: "Evaluations"
  end

  test "updating a Evaluation" do
    visit evaluation_url(@evaluation)
    click_on "Edit", match: :first

    fill_in "Company area", with: @evaluation.company_area_id
    fill_in "Name", with: @evaluation.name
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    assert_selector "h1", text: "Evaluations"
  end

  test "destroying a Evaluation" do
    visit edit_evaluation_url(@evaluation)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Evaluation was successfully destroyed"
  end
end
