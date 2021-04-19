class Message < ApplicationRecord
    belongs_to :user
    validates :body, presence: true, length: { minimum: 1 }

    scope :custom_display, -> {order(:created_at).last(20) }    #Custom Scope 
end
