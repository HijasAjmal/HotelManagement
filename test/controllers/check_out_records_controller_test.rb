require 'test_helper'

class CheckOutRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check_out_record = check_out_records(:one)
  end

  test "should get index" do
    get check_out_records_url
    assert_response :success
  end

  test "should get new" do
    get new_check_out_record_url
    assert_response :success
  end

  test "should create check_out_record" do
    assert_difference('CheckOutRecord.count') do
      post check_out_records_url, params: { check_out_record: { customer_id: @check_out_record.customer_id, date: @check_out_record.date, reason: @check_out_record.reason, room_id: @check_out_record.room_id, total_amount: @check_out_record.total_amount, total_days: @check_out_record.total_days } }
    end

    assert_redirected_to check_out_record_url(CheckOutRecord.last)
  end

  test "should show check_out_record" do
    get check_out_record_url(@check_out_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_check_out_record_url(@check_out_record)
    assert_response :success
  end

  test "should update check_out_record" do
    patch check_out_record_url(@check_out_record), params: { check_out_record: { customer_id: @check_out_record.customer_id, date: @check_out_record.date, reason: @check_out_record.reason, room_id: @check_out_record.room_id, total_amount: @check_out_record.total_amount, total_days: @check_out_record.total_days } }
    assert_redirected_to check_out_record_url(@check_out_record)
  end

  test "should destroy check_out_record" do
    assert_difference('CheckOutRecord.count', -1) do
      delete check_out_record_url(@check_out_record)
    end

    assert_redirected_to check_out_records_url
  end
end
