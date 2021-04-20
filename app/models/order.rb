class Order < ApplicationRecord
    has_many :items, dependent: :destroy

    validates :name, presence: true, length: { minimum: 1, maximum: 25 }

    #In Ruby, a variable is saved as CONSTANT when saved in All CAPITALS.  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                uniqueness: true, length: { maximum: 105 },
                format: {with: VALID_EMAIL_REGEX }
    validates :address, presence: true, length: { minimum: 1, maximum: 50 }

end
