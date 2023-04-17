require "application_system_test_case"

class VerificationsTest < ApplicationSystemTestCase
  setup do
    @verification = verifications(:one)
  end

  test "visiting the index" do
    visit verifications_url
    assert_selector "h1", text: "Verifications"
  end

  test "creating a Verification" do
    visit verifications_url
    click_on "New Verification"

    fill_in "Deadline", with: @verification.deadline
    fill_in "Evaluation", with: @verification.evaluation_id
    fill_in "Goal", with: @verification.goal
    fill_in "Grade", with: @verification.grade
    fill_in "Name", with: @verification.name
    fill_in "Weight", with: @verification.weight
    click_on "Create Verification"

    assert_text "Verification was successfully created"
    assert_selector "h1", text: "Verifications"
  end

  test "updating a Verification" do
    visit verification_url(@verification)
    click_on "Edit", match: :first

    fill_in "Deadline", with: @verification.deadline
    fill_in "Evaluation", with: @verification.evaluation_id
    fill_in "Goal", with: @verification.goal
    fill_in "Grade", with: @verification.grade
    fill_in "Name", with: @verification.name
    fill_in "Weight", with: @verification.weight
    click_on "Update Verification"

    assert_text "Verification was successfully updated"
    assert_selector "h1", text: "Verifications"
  end

  test "destroying a Verification" do
    visit edit_verification_url(@verification)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Verification was successfully destroyed"
  end
end
