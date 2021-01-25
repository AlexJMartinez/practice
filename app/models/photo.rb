class Photo < ApplicationRecord

    scope :most_recent, -> { order(url: :desc).limit(5) }
  
    belongs_to :user

    has_many :comments
    has_many :users, through: :comments
    
    validates :title, presence: { message: "can't be blank!"}
    validates :url, presence: { message: "can't be blank!"}


end
