puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: Restaurant::CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
  restaurant.save!
end

puts "Finished! Created #{Restaurant.count} restaurants."
