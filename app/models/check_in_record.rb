class CheckInRecord < ApplicationRecord
  # validations
  validates_presence_of :date, :room_id

  # associations
  belongs_to :room
  has_one :customer, :dependent => :destroy

  # callbacks
  after_create :update_room_status
  before_update :update_old_room_status_if_room_changed
  validate :room_availability

  accepts_nested_attributes_for :customer, :allow_destroy => true

  # update rooms status after check in the same room
  def update_room_status
    room.update(:is_available => false)
  end

  # updating old room status before destroying the check in record
  def update_old_room_status_if_room_changed
    Room.find_by(:id => room_id_was).update(:is_available => true)
    room.update(:is_available => false)
  end

  # validating select room availability
  def room_availability
    if room_id_changed?
      if room.is_available
        return true
      else
        self.errors.add(:room_id, I18n.t("check_in_records.room_not_available"))
      end
    end
  end
end
