class Category < ApplicationRecord

    has_many :product_categories
    has_many :products, through: :product_categories

    validates :name, presence: true, length: { minimum: 1, maximum: 35 }
end