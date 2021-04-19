class Product < ApplicationRecord

    # "dependent: :destroy" to destroy dependents.
    # has_many :images, dependent: :destroy

    # serialize :category

    # after_initialize do |product|
    #     product.category= [] if patient.category == nil
    # end

    has_many :product_categories
    has_many :categories, through: :product_categories

    # has_many :items
    # has_and_belongs_to_many :object, join_table: "table_name", foreign_key: "object_id"


    has_many :item_products
    has_many :items, through: :item_products

    validates :name, presence: true, length: { minimum: 1, maximum: 35 }

    validates :price, presence: true
                # , 
                # numericality: { only_integer: true },
                # value: { minimum: 1}
    
end