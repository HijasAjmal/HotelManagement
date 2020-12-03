require "application_system_test_case"

class CheckInRecordsTest < ApplicationSystemTestCase
  setup do
    @check_in_record = check_in_records(:one)
  end

  test "visiting the index" do
    visit check_in_records_url
    assert_selector "h1", text: "Check In Records"
  end

  test "creating a Check in record" do
    visit check_in_records_url
    click_on "New Check In Record"

    fill_in "Date", with: @check_in_record.date
    fill_in "Room", with: @check_in_record.room_id
    click_on "Create Check in record"

    assert_text "Check in record was successfully created"
    click_on "Back"
  end

  test "updating a Check in record" do
    visit check_in_records_url
    click_on "Edit", match: :first

    fill_in "Date", with: @check_in_record.date
    fill_in "Room", with: @check_in_record.room_id
    click_on "Update Check in record"

    assert_text "Check in record was successfully updated"
    click_on "Back"
  end

  test "destroying a Check in record" do
    visit check_in_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Check in record was successfully destroyed"
  end
end
