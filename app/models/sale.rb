class Sale < ApplicationRecord
  belongs_to :item
  belongs_to :purchaser, class_name: "Person"
end
