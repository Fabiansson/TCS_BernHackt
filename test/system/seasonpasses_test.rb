require "application_system_test_case"

class SeasonpassesTest < ApplicationSystemTestCase
  setup do
    @seasonpass = seasonpasses(:one)
  end

  test "visiting the index" do
    visit seasonpasses_url
    assert_selector "h1", text: "Seasonpasses"
  end

  test "creating a Seasonpass" do
    visit seasonpasses_url
    click_on "New Seasonpass"

    fill_in "Club", with: @seasonpass.club_id
    fill_in "User", with: @seasonpass.user_id
    click_on "Create Seasonpass"

    assert_text "Seasonpass was successfully created"
    click_on "Back"
  end

  test "updating a Seasonpass" do
    visit seasonpasses_url
    click_on "Edit", match: :first

    fill_in "Club", with: @seasonpass.club_id
    fill_in "User", with: @seasonpass.user_id
    click_on "Update Seasonpass"

    assert_text "Seasonpass was successfully updated"
    click_on "Back"
  end

  test "destroying a Seasonpass" do
    visit seasonpasses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seasonpass was successfully destroyed"
  end
end
