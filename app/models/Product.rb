class Product < ApplicationRecord

    # "dependent: :destroy" to destroy dependents.
    # has_many :images, dependent: :destroy

    # serialize :category

    # after_initialize do |product|
    #     product.category= [] if patient.category == nil
    # end

    
    has_many :product_categories
    has_many :categories, through: :product_categories

    validates :name, presence: true, length: { minimum: 1, maximum: 35 }

    validates :price, presence: true
                # , 
                # numericality: { only_integer: true },
                # value: { minimum: 1}
    
end