class Room < ApplicationRecord
  # validations
  validates_presence_of :room_no, :room_type_id, :rent
  validates_uniqueness_of :room_no
  validates_numericality_of :room_no, :room_type_id

  # associations
  belongs_to :room_type
  has_many :check_in_records
  has_many :check_out_records


  # fetch customer details
  def customer_details
    check_out_record = self.check_in_records.order("date").last
    customer = check_out_record.customer if check_out_record.present?
    customer
  end

  # generate checkout details
  def generate_checkout_details
    payable_amount = 0.00
    days = 0
    check_in_record = self.check_in_records.order("date").last
    if check_in_record.present?
      room = check_in_record.room
      days = (Time.now.strftime("%y/%m/%d").to_date - check_in_record.date.strftime("%y/%d/%m").to_date).to_i
      room_rent = room.rent
      payable_amount = days * room_rent.to_f
    end
    return payable_amount, days
  end
end
