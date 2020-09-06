class Station < ApplicationRecord
  belongs_to :estate, dependent: :destroy
end
