# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Cleaning the database
puts "clearing DB"

User.destroy_all
HealthRecord.destroy_all
Appointment.destroy_all
Medicine.destroy_all

# Creating the database
puts "creating DB"

# Creating the users
gary = User.new(username: "gary", address: "507-12 Uchikanna, Chita gun taketoyo cho, Aichi ken", email: "toppiggary@hotmail.com", password: "123456")
gary.save!
ritsuki = User.new(username: "ritsuki", address: "58-18 Katsumotocho nakafure, Iki shi, Nagasaki ken", email: "ricky0912t@gmail.com", password: "123456")
ritsuki.save!
james = User.new(username: "james", address: "12-13 Ogawa, Tone gun minakami machi, Gumma ken", email: "hkjl87@hotmail.co.uk", password: "123456")
james.save!
alvin = User.new(username: "alvin", address: "356-3 Muyacho kizu, Naruto shi, Tokushima ken", email: "ayaualvin@gmail.com", password: "123456")
alvin.save!

20.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    birth_date: Faker::Date.birthday(min_age: 65, max_age: 95)
  )
  user.save!
end

puts "created #{User.count} users"

# Creating the health records
20.times do
  health_record = HealthRecord.new(
    mood_status: rand(1..5),
    weight: rand(45..70),
    sys: rand(70..110),
    dia: rand(120..160),
    pulse: Faker::PhoneNumber.cell_phone,
    user_id:
  )
  health_record.save!
end

# Creating the appointments
puts "Creating Appointments"
20.times do
  appointment = Appointment.new(
    name: rand(1..5),
    description: rand(45..70),
    dosage: rand(70..110),
    units_remaining: rand(120..160),
    start_date: DateTime.now - Random.rand(10..24),
    end_date: DateTime.now - Random.rand(1..9),
    time_to_take:,
    user_id:
  )
  appointment.save!
end

# Creating the medicines
puts "Creating Medicines"
20.times do
  medicine = Medicine.new(
    name: rand(1..5),
    description: rand(45..70),
    dosage: rand(70..110),
    units_remaining: rand(120..160),
    start_date: DateTime.now - Random.rand(10..24),
    end_date: DateTime.now - Random.rand(1..9),
    time_to_take:,
    user_id:
  )
  medicine.save!
end

# Creating the taken_records
3.times do
  (1..20).each do |medicine_id|
    TakenRecord.create!(medicine_id: medicine_id)
  end
end
