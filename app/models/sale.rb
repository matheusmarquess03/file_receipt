class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :purchaser, class_name: "Person"

  validates :quantity, presence: true
end
