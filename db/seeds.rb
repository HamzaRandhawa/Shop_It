# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   User.create(username: 'Hamza', email: 'hamzarandhawa553@gmail.com', password: 'pass')
#   User.create(username: 'Umer', email: 'umerrandhawa99@gmail.com', password: 'pass')

# User.create(username: 'Zaid', email: 'z@z.com', password: 'pass', admin: true);

Cart.create(user_id: 2)
Item.create(quantity: 1, product_id: 1, cart_id: 1);


# Category.create(name: 'Plants & Gardening', description: 'Gardening is the practice of growing and cultivating plants as part of horticulture. In gardens, ornamental plants are often grown for their flowers, foliage, or overall appearance; useful plants, such as root vegetables, leaf vegetables, fruits, and herbs, are grown for consumption, for use as dyes, or for medicinal or cosmetic use.');

# Product.create(name: 'Strawberry Plant', price: 10.99);
# Product.create(name: 'Orange Citrus Plant', price: 15.99);
# Product.create(name: 'Codiaeum Plant', price: 24.49);


