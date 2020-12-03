class Customer < ApplicationRecord
  # validations
  validates_presence_of :first_name, :last_name, :address, :phone, :email, :gender, :age
  validates_numericality_of :age

  # associations
  belongs_to :check_in_record

  # generating full name of customer
  def full_name
    [first_name, middle_name, last_name].join(" ")
  end
end
