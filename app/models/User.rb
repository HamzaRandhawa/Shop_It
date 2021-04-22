class User < ApplicationRecord
    before_save {self.email = email.downcase}
    before_save {self.username = username.downcase}
    before_create :confirmation_token

    has_many :messages
    has_one :cart

    # "dependent: :destroy" to destroy dependents.
    # has_many :articles, dependent: :destroy
    validates :username, presence: true, length: { minimum: 3, maximum: 25 }

    validates :password, presence: true, length: { minimum: 4, maximum: 25 }


    #In Ruby, a variable is saved as CONSTANT when saved in All CAPITALS.  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                uniqueness: true, length: { maximum: 105 },
                format: {with: VALID_EMAIL_REGEX }
    has_secure_password

    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
      end
end