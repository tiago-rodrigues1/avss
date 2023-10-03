require "application_system_test_case"

class CircuitApplicationsTest < ApplicationSystemTestCase
  setup do
    @circuit_application = circuit_applications(:one)
  end

  test "visiting the index" do
    visit circuit_applications_url
    assert_selector "h1", text: "Circuit applications"
  end

  test "should create circuit application" do
    visit circuit_applications_url
    click_on "New circuit application"

    fill_in "Circuit", with: @circuit_application.circuit_id
    fill_in "Link", with: @circuit_application.link
    click_on "Create Circuit application"

    assert_text "Circuit application was successfully created"
    click_on "Back"
  end

  test "should update Circuit application" do
    visit circuit_application_url(@circuit_application)
    click_on "Edit this circuit application", match: :first

    fill_in "Circuit", with: @circuit_application.circuit_id
    fill_in "Link", with: @circuit_application.link
    click_on "Update Circuit application"

    assert_text "Circuit application was successfully updated"
    click_on "Back"
  end

  test "should destroy Circuit application" do
    visit circuit_application_url(@circuit_application)
    click_on "Destroy this circuit application", match: :first

    assert_text "Circuit application was successfully destroyed"
  end
end
