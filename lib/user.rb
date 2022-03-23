class User < ActiveRecord::Base
  has_many :spaces
  has_many :bookings
  has_secure_password 
  validates :first_name, :last_name, :email, :presence => true
  validates_uniqueness_of :email
end
