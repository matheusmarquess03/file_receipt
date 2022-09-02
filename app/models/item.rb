class Item < ApplicationRecord
  belongs_to :merchant, class_name: "Person"

  has_many :sales
end
