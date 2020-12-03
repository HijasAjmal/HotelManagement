class CheckOutRecord < ApplicationRecord
  # validations
  validates_presence_of :date, :room_id, :customer_id, :total_days, :total_amount, :reason
  validates_numericality_of :total_days

  # associations
  belongs_to :room
  belongs_to :customer

  # callbacks
  validate :validate_checkout_record
  after_create :update_room_status

  # validations for date and room availability
  def validate_checkout_record
    if date.present? && (date.strftime("%y/%d/%m").to_date >= Time.now.strftime("%y/%m/%d").to_date)
      return true
    else
      self.errors.add(:date, I18n.t('check_out_records.check_out_date_error'))
    end

    if room.present?
      if room.is_available
        self.errors.add(:room_id, I18n.t("check_out_records.room_availability_error"))
      end
    end
  end

  # update room status after checkout
  def update_room_status
    room.update(:is_available => true)
  end
end
