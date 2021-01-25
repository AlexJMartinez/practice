class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :photo 

    validates :content, presence: { message: "can't be blank!"}
    
end
