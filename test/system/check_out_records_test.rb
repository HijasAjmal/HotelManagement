require "application_system_test_case"

class CheckOutRecordsTest < ApplicationSystemTestCase
  setup do
    @check_out_record = check_out_records(:one)
  end

  test "visiting the index" do
    visit check_out_records_url
    assert_selector "h1", text: "Check Out Records"
  end

  test "creating a Check out record" do
    visit check_out_records_url
    click_on "New Check Out Record"

    fill_in "Customer", with: @check_out_record.customer_id
    fill_in "Date", with: @check_out_record.date
    fill_in "Reason", with: @check_out_record.reason
    fill_in "Room", with: @check_out_record.room_id
    fill_in "Total amount", with: @check_out_record.total_amount
    fill_in "Total days", with: @check_out_record.total_days
    click_on "Create Check out record"

    assert_text "Check out record was successfully created"
    click_on "Back"
  end

  test "updating a Check out record" do
    visit check_out_records_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @check_out_record.customer_id
    fill_in "Date", with: @check_out_record.date
    fill_in "Reason", with: @check_out_record.reason
    fill_in "Room", with: @check_out_record.room_id
    fill_in "Total amount", with: @check_out_record.total_amount
    fill_in "Total days", with: @check_out_record.total_days
    click_on "Update Check out record"

    assert_text "Check out record was successfully updated"
    click_on "Back"
  end

  test "destroying a Check out record" do
    visit check_out_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Check out record was successfully destroyed"
  end
end
