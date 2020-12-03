require 'test_helper'

class CheckInRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check_in_record = check_in_records(:one)
  end

  test "should get index" do
    get check_in_records_url
    assert_response :success
  end

  test "should get new" do
    get new_check_in_record_url
    assert_response :success
  end

  test "should create check_in_record" do
    assert_difference('CheckInRecord.count') do
      post check_in_records_url, params: { check_in_record: { date: @check_in_record.date, room_id: @check_in_record.room_id } }
    end

    assert_redirected_to check_in_record_url(CheckInRecord.last)
  end

  test "should show check_in_record" do
    get check_in_record_url(@check_in_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_check_in_record_url(@check_in_record)
    assert_response :success
  end

  test "should update check_in_record" do
    patch check_in_record_url(@check_in_record), params: { check_in_record: { date: @check_in_record.date, room_id: @check_in_record.room_id } }
    assert_redirected_to check_in_record_url(@check_in_record)
  end

  test "should destroy check_in_record" do
    assert_difference('CheckInRecord.count', -1) do
      delete check_in_record_url(@check_in_record)
    end

    assert_redirected_to check_in_records_url
  end
end
