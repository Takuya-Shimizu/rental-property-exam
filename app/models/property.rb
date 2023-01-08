class Property < ApplicationRecord
  validates :property_name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  has_many :nearest_stations
  accepts_nested_attributes_for :nearest_stations, reject_if: :all_blank
end