class Address < ApplicationRecord
  belongs_to :person

  validates :street, :number, presence: true
end
