# Cleaning the database
puts "Clearing DB"

#Destroying the database
Support.destroy_all
Reminder.destroy_all
Medicine.destroy_all
Appointment.destroy_all
HealthRecord.destroy_all
User.destroy_all

# Creating the database
puts "Creating DB"

# Creating the users (elderly)
puts "----------------------------------------------"
puts "Creating Users"

#elderlies
john = User.new(
  email: "displayelderly@test.com",
  password: "123456",
  first_name: "John",
  last_name: "Smith",
  gender: "male",
  address: "G/F, 38 Autumn Garden Ln, Kow Loon, Hong Kong",
  phone_number: "+818012345678",
  birth_date: "22/12/1945",
  height: rand(140..200),
  latitude: -90 + (180 * rand),
  longtitude: -180 + (360 * rand),
  elderly: true
)
john.save!

jenny = User.new(
  email: "sandboxelderly@test.com",
  password: "123456",
  first_name: "Jenny",
  last_name: "Smith",
  gender: "female",
  address: "Big Ben Westminster, London SW1A 0AA, UK",
  phone_number: "+817012345678",
  birth_date: "11/05/1955",
  height: rand(140..200),
  latitude: -90 + (180 * rand),
  longtitude: -180 + (360 * rand),
  elderly: true
)
jenny.save!

#caregivers

david = User.new(
  email: "displaycaregiver@test.com",
  password: "123456",
  first_name: "David",
  last_name: "Brown",
  gender: "male",
  address: "2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063",
  phone_number: "+818012345678",
  birth_date: "12/09/1997",
  elderly: false
)
david.save!

chris = User.new(
  email: "sandboxcaregiver@test.com",
  password: "123456",
  first_name: "Chris",
  last_name: "Summers",
  gender: "male",
  address: "2-24-12 Shibuya, Shibuya-ku, Tokyo",
  phone_number: "+817012345678",
  birth_date: "15/08/1989",
  elderly: false
)
chris.save!

puts "Created #{User.count} Users"
puts "----------------------------------------------"

# ------------------------------------------------------------------------------- #

# Creating the medicines
puts "Creating Medicines"

john_medicine_1 = Medicine.new(
  name: "Liver Support",
  description: "Liver Support",
  dosage: 1,
  dosage_remaining: 72,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: john.id
  )
file = File.open("db/images/liver_support.jpg")
john_medicine_1.photo.attach(io: file, filename: "liver_support.jpg")
john_medicine_1.save!

john_medicine_2 = Medicine.new(
  name: "Multivitamins",
  description: "For Basic Health",
  dosage: 2,
  dosage_remaining: 102,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 2,
  user_id: john.id
  )
file = File.open("db/images/vitamin-pho.jpg")
john_medicine_2.photo.attach(io: file, filename: "vitamin-pho.jpg")
john_medicine_2.save!

john_medicine_3 = Medicine.new(
  name: "Fish Oil & D3",
  description: "Fish Oil & D3",
  dosage: 1,
  dosage_remaining: 56,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: john.id
  )
file = File.open("db/images/fishoil.jpg")
john_medicine_3.photo.attach(io: file, filename: "fishoil.jpg")
john_medicine_3.save!

john_medicine_4 = Medicine.new(
  name: "Heart Supplement",
  description: "For Bone Strength",
  dosage: 1,
  dosage_remaining: 83,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: john.id
  )
file = File.open("db/images/heart.jpg")
john_medicine_4.photo.attach(io: file, filename: "heart.jpg")
john_medicine_4.save!

john_medicine_5 = Medicine.new(
  name: "Blood Sugar",
  description: "Blood Sugar",
  dosage: 1,
  dosage_remaining: 38,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: john.id
  )
  file = File.open("db/images/blood-sugar.jpg")
  john_medicine_5.photo.attach(io: file, filename: "blood-sugar.jpg")
  john_medicine_5.save!

jenny_medicine_1 = Medicine.new(
  name: "Warfarin",
  description: "An anticoagulant used to prevent blood clot formation in conditions like atrial fibrillation and deep vein thrombosis.",
  dosage: 1,
  dosage_remaining: 45,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: jenny.id
)
jenny_medicine_1.save!

jenny_medicine_2 = Medicine.new(
  name: "Aspirin",
  description: "A blood thinner used to prevent heart attacks, strokes, and reduce the risk of blood clot formation.",
  dosage: 1,
  dosage_remaining: 39,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: jenny.id
)
jenny_medicine_2.save!

jenny_medicine_3 = Medicine.new(
  name: "Omeprazole",
  description: "A bronchodilator used to relieve symptoms of asthma and chronic obstructive pulmonary disease (COPD).",
  dosage: 1,
  dosage_remaining: 33,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: jenny.id
)
jenny_medicine_3.save!

jenny_medicine_4 = Medicine.new(
  name: "Enalapril",
  description: "An ACE inhibitor used to manage high blood pressure and heart failure.",
  dosage: 2,
  dosage_remaining: 111,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 2,
  user_id: jenny.id
)
jenny_medicine_4.save!

jenny_medicine_5 = Medicine.new(
  name: "Hydrochlorothiazide",
  description: "To treat high blood sugar levels that are caused by a type of diabetes mellitus or sugar diabetes called type 2 diabetes.",
  dosage: 1,
  dosage_remaining: 26,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: jenny.id
)
jenny_medicine_5.save!

puts "Created #{Medicine.count} Medicines"
puts "----------------------------------------------"

puts "Creating Supports"

#Creating the supports

# has_many :trusted_users, through: :supports_as_elderly, class_name: "User", foreign_key: :elderly_id

john_trusted_user = Support.new(
  elderly_id: john.id,
  trusted_user_id: david.id
)
file = URI.open('db/images/senior-ppl.jpg')
john_trusted_user.photo.attach(io: file, filename: 'senior-ppl.jpg', content_type: 'image/jpg')
john_trusted_user.save!

jenny_trusted_user = Support.new(
  elderly_id: jenny.id,
  trusted_user_id: david.id
)
file = URI.open('db/images/oldwoman.jpg')
jenny_trusted_user.photo.attach(io: file, filename: 'oldwoman.jpg', content_type: 'image/jpg')
jenny_trusted_user.save!

puts "Created #{Support.count} Supports"

# Creating the appointments
puts "----------------------------------------------"
puts "Creating Medical Appointments"

start_time = DateTime.now + rand(72..144).hours
specific_start_time = DateTime.now + 23.hours
long_start_time = DateTime.now + rand(240..360).hours
start_time = [start_time.change(hour: 9, min: 0, sec: 0), start_time.change(hour: 18, min: 0, sec: 0)].max
specific_start_time = [specific_start_time.change(hour: 9, min: 0, sec: 0), specific_start_time.change(hour: 18, min: 0, sec: 0)].max
long_start_time = [long_start_time.change(hour: 9, min: 0, sec: 0), long_start_time.change(hour: 18, min: 0, sec: 0)].max

john_appointment = Appointment.new(
  name: "Medical Check-up",
  description: "Full body check annually. Diabetes monitoring.",
  start_time: specific_start_time,
  end_time: specific_start_time + rand(1..2).hours,
  address: "30 Gascoigne Road, Yau Ma Tei, Hong Kong",
  latitude: 22.309330466082702,
  longitude: 114.1744068830591,
  user_id: john.id
)
john_appointment.save!

john_appointment2 = Appointment.new(
  name: "Visit Dentist",
  description: "Teeth Whitening",
  start_time: start_time,
  end_time: start_time + rand(1..2).hours,
  address: "2-11-3 Meguro, Meguro-ku, Tokyo",
  latitude: 35.6406769304616,
  longitude: 139.6991768776612,
  user_id: john.id
)
john_appointment2.save!

john_appointment3 = Appointment.new(
  name: "Chiropractor",
  description: "For aches in back",
  start_time: long_start_time,
  end_time: long_start_time + rand(1..2).hours,
  address: "3-15-7 Shinjuku, Tokyo-to, Tokyo",
  latitude: 35.68663519546136,
  longitude: 139.69116210775576,
  user_id: john.id
)
john_appointment3.save!

jenny_appointment = Appointment.new(
name: "Medical Check-up",
description: "Annual check-up. In particular if any significant changes regarding diabetes",
start_time: start_time,
end_time: start_time + rand(1..4).hours,
address: "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
latitude: 35.629519458799976,
longitude: 139.6844641164838,
user_id: jenny.id
)
jenny_appointment.save!

jenny_appointment2 = Appointment.new(
  name: "Visit Dentist",
  description: "Teeth Whitening",
  start_time: long_start_time,
  end_time: long_start_time + rand(1..4).hours,
  address: "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
  latitude: 35.63659824150726,
  longitude: 139.6906442178495,
  user_id: jenny.id
  )
  jenny_appointment2.save!

puts "created #{Appointment.count} Medical Appointments"

puts "----------------------------------------------"
puts "Creating Health Records"

# Creating the health records
7.times do |i|
  date = Date.today - (i + 1).days
  john_health_record = HealthRecord.new(
    mood_status: rand(1..5),
    weight: rand(45..120),
    sys: rand(100..140),
    dia: rand(60..120),
    pulse: rand(40..80),
    user_id: john.id,
    date: date
  )
  john_health_record.save!
end

7.times do |i|
  date = Date.today - (i + 1).days
  jenny_health_record = HealthRecord.new(
    mood_status: rand(1..5),
    weight: rand(45..120),
    sys: rand(100..140),
    dia: rand(60..120),
    pulse: rand(40..80),
    user_id: jenny.id,
    date: date
  )
  jenny_health_record.save!
end

puts "Created #{HealthRecord.count} Health Records"

# Creating the reminders

puts "----------------------------------------------"
puts "Creating Reminders"

john_reminder_1 = Reminder.new(
  time_to_taken: DateTime.new(2023, 9, 1, 8, 15),
  dosage: john_medicine_1.dosage,
  taken: true,
  medicine_id: john_medicine_1.id
)
john_reminder_1.save!

john_reminder_2 = Reminder.new(
  time_to_taken: DateTime.new(2023, 9, 1, 12, 15),
  dosage: john_medicine_2.dosage,
  taken: true,
  medicine_id: john_medicine_2.id
)
john_reminder_2.save!

john_reminder_3 = Reminder.new(
  time_to_taken: DateTime.new(2023, 9, 1, 18, 15),
  dosage: john_medicine_3.dosage,
  taken: true,
  medicine_id: john_medicine_3.id
)
john_reminder_3.save!

john_reminder_4 = Reminder.new(
  time_to_taken: DateTime.new(2023, 9, 1, 22, 15),
  dosage: john_medicine_4.dosage,
  taken: true,
  medicine_id: john_medicine_4.id
)
john_reminder_4.save!

john_reminder_5 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 22, 15),
  dosage: john_medicine_5.dosage,
  taken: true,
  medicine_id: john_medicine_5.id
)
john_reminder_5.save!

jenny_reminder_1 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: jenny_medicine_1.dosage,
  taken: false,
  medicine_id: jenny_medicine_1.id
)
jenny_reminder_1.save!

jenny_reminder_2 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: jenny_medicine_2.dosage,
  taken: false,
  medicine_id: jenny_medicine_2.id
)
jenny_reminder_2.save!

jenny_reminder_3 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: jenny_medicine_3.dosage,
  taken: false,
  medicine_id: jenny_medicine_3.id
)
jenny_reminder_3.save!

jenny_reminder_4 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: jenny_medicine_4.dosage,
  taken: false,
  medicine_id: jenny_medicine_4.id
)
jenny_reminder_4.save!

jenny_reminder_5 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: jenny_medicine_5.dosage,
  taken: false,
  medicine_id: jenny_medicine_5.id
)
jenny_reminder_5.save!

puts "Created #{Reminder.count} Reminders"
puts "----------------------------------------------"
