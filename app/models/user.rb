class User < ApplicationRecord
  has_many :sales

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  before_save { self.email = email.downcase }

  validates_presence_of :email
end
