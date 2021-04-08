class User < ApplicationRecord
    before_save {self.email = email.downcase}
    before_save {self.username = username.downcase}

    # "dependent: :destroy" to destroy dependents.
    # has_many :articles, dependent: :destroy
    validates :username, presence: true, length: { minimum: 3, maximum: 25 }

    #In Ruby, a variable is saved as CONSTANT when saved in All CAPITALS.  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                uniqueness: true, length: { maximum: 105 },
                format: {with: VALID_EMAIL_REGEX }
    has_secure_password
end