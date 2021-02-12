class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :photo 

    validates :content, presence: { message: "can't be blank!"}
    validates :user_id, presence: true
    validates :photo_id, presence: true
    
end
