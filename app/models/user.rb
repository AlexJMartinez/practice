class User < ApplicationRecord
  
  has_secure_password

  has_many :photos
  has_many :comments, through: :photos

  validates :username, uniqueness: { message: "already taken!"}
  validates :username, presence: { message: "can't be blank!"}
  validates :email, uniqueness: { message: "already taken!"}
  validates :email, presence: { message: "can't be blank!"}
  

end
