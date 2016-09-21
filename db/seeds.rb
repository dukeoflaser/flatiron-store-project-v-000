10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

user = User.new
user.email = 'nathaniel@example.com'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

user2 = User.new
user2.email = 'tim@example.com'
user2.password = 'valid_password'
user2.password_confirmation = 'valid_password'
user2.save!

user3 = User.new
user3.email = 'jason@example.com'
user3.password = 'valid_password'
user3.password_confirmation = 'valid_password'
user3.save!

user4 = User.new
user4.email = 'jefferson@example.com'
user4.password = 'valid_password'
user4.password_confirmation = 'valid_password'
user4.save!

user5 = User.new
user5.email = 'bendson@example.com'
user5.password = 'valid_password'
user5.password_confirmation = 'valid_password'
user5.save!
