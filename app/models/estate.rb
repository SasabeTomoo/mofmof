class Estate < ApplicationRecord
  has_one :station, dependent: :destroy
  accepts_nested_attributes_for :station
end
