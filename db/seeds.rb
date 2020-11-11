require 'faker'

10.times do
  Flat.create!(
    name: Faker::Lorem.sentence,
    address: Faker::Address.full_address,
    description: Faker::Quote.famous_last_words,
    price_per_night: rand(20..600),
    number_of_guests: rand(1..10)
  )
end
