require "application_system_test_case"

class RelatoriosTest < ApplicationSystemTestCase
  setup do
    @relatorio = relatorios(:one)
  end

  test "visiting the index" do
    visit relatorios_url
    assert_selector "h1", text: "Relatorios"
  end

  test "creating a Relatorio" do
    visit relatorios_url
    click_on "New Relatorio"

    click_on "Create Relatorio"

    assert_text "Relatorio was successfully created"
    assert_selector "h1", text: "Relatorios"
  end

  test "updating a Relatorio" do
    visit relatorio_url(@relatorio)
    click_on "Edit", match: :first

    click_on "Update Relatorio"

    assert_text "Relatorio was successfully updated"
    assert_selector "h1", text: "Relatorios"
  end

  test "destroying a Relatorio" do
    visit edit_relatorio_url(@relatorio)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Relatorio was successfully destroyed"
  end
end
