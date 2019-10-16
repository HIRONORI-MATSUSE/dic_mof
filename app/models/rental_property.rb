class RentalProperty < ApplicationRecord
  has_many :desired_conditions, dependent: :destroy
  accepts_nested_attributes_for :desired_conditions, allow_destroy: true
  validates :rent, presence: true
  validates :street_address, presence: true
  validates :house_age, presence: true
  validates :remarks, presence: true
  validates :property_name , presence: true
end
