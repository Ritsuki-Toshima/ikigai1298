require 'faker'

# Cleaning the database
puts "clearing DB"

#Destroying the database\
User.destroy_all
HealthRecord.destroy_all
Appointment.destroy_all
Medicine.destroy_all
Reminder.destroy_all
Support.destroy_all

# Creating the database
puts "creating DB"

# Creating the users (elderly)
alvin = User.new(
  email: "ayaualvin@gmail.com",
  password: "123456",
  first_name: "ken",
  last_name: "yau",
  gender: "male",
  address: "G/F, 20 Spring Garden Ln, Wan Chai, Hong Kong",
  phone_number: "9123 3678",
  birth_date: "22/12/1945",
  height: rand(140..200),
  latitude: -90 + (180 * rand),
  longtitude: -180 + (360 * rand)
)
alvin.save!

james = User.new(
  email: "hkjl87@hotmail.co.uk",
  password: "123456",
  first_name: "james",
  last_name: "lau",
  gender: "male",
  address: "Big Ben Westminster, London SW1A 0AA, UK",
  phone_number: "9123 3678",
  birth_date: "22/12/1945",
  height: rand(140..200),
  latitude: -90 + (180 * rand),
  longtitude: -180 + (360 * rand)
)
james.save!

# Creating the users (caregivers)
ritsuki = User.new(
  email: "ricky0912t@gmail.com",
  password: "123456",
  first_name: "ritsuki",
  last_name: "toshima",
  gender: "male",
  address: "2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063",
  phone_number: "080-9290-8767"
)
ritsuki.save!

puts "created #{User.count} users"

# ------------------------------------------------------------------------------- #

# Creating the medicines
puts "Creating Medicines"

alvin_medicine = Medicine.new(
    name: "Diuretic",
    description: "Help reduce fluid buildup in the body.",
    dosage: 2,
    dosage_remaining: 230,
    unit: "tablets",
    start_date: DateTime.now - Random.rand(10..24),
    end_date: DateTime.now + Random.rand(365..730),
    frequency: 2,
    user_id: alvin.id
  )
alvin_medicine.save!






# Creating the taken_records
3.times do
  (1..20).each do |medicine_id|
    TakenRecord.create!(medicine_id: medicine_id)
  end
end





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
