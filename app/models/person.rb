class Person < ApplicationRecord
  has_many :addresses
  has_many :items, class_name: "Item", foreign_key: "merchant_id"
  has_many :sales, class_name: "Sale", foreign_key: "purchaser_id"
end
