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
alvin = User.new(
  email: "ayaualvin@gmail.com",
  password: "123456",
  first_name: "alvin",
  last_name: "yau",
  gender: "male",
  address: "G/F, 20 Spring Garden Ln, Wan Chai, Hong Kong",
  phone_number: "+818060262293",
  birth_date: "22/12/1945",
  height: rand(140..200),
  latitude: -90 + (180 * rand),
  longtitude: -180 + (360 * rand),
)
alvin.save!

james = User.new(
  email: "hkjl87@hotmail.co.uk",
  password: "123456",
  first_name: "james",
  last_name: "lau",
  gender: "male",
  address: "Big Ben Westminster, London SW1A 0AA, UK",
  phone_number: "+817044676711",
  birth_date: "11/05/1955",
  height: rand(140..200),
  latitude: -90 + (180 * rand),
  longtitude: -180 + (360 * rand)
)
james.save!

#caregivers

ritsuki = User.new(
  email: "ricky0912t@gmail.com",
  password: "123456",
  first_name: "ritsuki",
  last_name: "toshima",
  gender: "male",
  address: "2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063",
  phone_number: "+818048168800",
  birth_date: "12/09/1997",
)
ritsuki.save!

gary = User.new(
  email: "toppinggary@hotmail.com",
  password: "123456",
  first_name: "gary",
  last_name: "topping",
  gender: "male",
  address: "2-24-12 Shibuya, Shibuya-ku, Tokyo",
  phone_number: "+817031380309",
  birth_date: "15/08/1989",
)
gary.save!

puts "Created #{User.count} Users"
puts "----------------------------------------------"

# ------------------------------------------------------------------------------- #

# Creating the medicines
puts "Creating Medicines"

alvin_medicine_1 = Medicine.new(
  name: "Chloesterol",
  description: "Chloeserol",
  dosage: 1,
  dosage_remaining: 38,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: alvin.id
  )
  file = File.open("db/images/chloesterol.jpg")
  alvin_medicine_1.photo.attach(io: file, filename: "chloesterol.jpg")
  alvin_medicine_1.save!

alvin_medicine_2 = Medicine.new(
  name: "Liver Support",
  description: "For Liver Support",
  dosage: 2,
  dosage_remaining: 102,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 2,
  user_id: alvin.id
  )
file = File.open("db/images/liver_support.jpg")
alvin_medicine_2.photo.attach(io: file, filename: "liver_support.jpg")
alvin_medicine_2.save!

alvin_medicine_3 = Medicine.new(
  name: "Astaxanthin",
  description: "For feed supplement as food colorant for salmon, crabs, shrimp, chickens and egg production",
  dosage: 1,
  dosage_remaining: 56,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: alvin.id
  )
file = File.open("db/images/Astaxanthin.jpg")
alvin_medicine_3.photo.attach(io: file, filename: "Astaxanthin.jpg")
alvin_medicine_3.save!

alvin_medicine_4 = Medicine.new(
  name: "Bone Strength",
  description: "For Bone Strength",
  dosage: 1,
  dosage_remaining: 83,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: alvin.id
  )
file = File.open("db/images/bone_strength.jpg")
alvin_medicine_4.photo.attach(io: file, filename: "bone_strength.jpg")
alvin_medicine_4.save!

alvin_medicine_5 = Medicine.new(
  name: "Calcium & Magnesium",
  description: "General Health",
  dosage: 1,
  dosage_remaining: 72,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: alvin.id
  )
file = File.open("db/images/cal_mg.jpg")
alvin_medicine_5.photo.attach(io: file, filename: "cal_mg.jpg")
alvin_medicine_5.save!

james_medicine_1 = Medicine.new(
  name: "Warfarin",
  description: "An anticoagulant used to prevent blood clot formation in conditions like atrial fibrillation and deep vein thrombosis.",
  dosage: 1,
  dosage_remaining: 45,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: james.id
)
james_medicine_1.save!

james_medicine_2 = Medicine.new(
  name: "Aspirin",
  description: "A blood thinner used to prevent heart attacks, strokes, and reduce the risk of blood clot formation.",
  dosage: 1,
  dosage_remaining: 39,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: james.id
)
james_medicine_2.save!

james_medicine_3 = Medicine.new(
  name: "Omeprazole",
  description: "A bronchodilator used to relieve symptoms of asthma and chronic obstructive pulmonary disease (COPD).",
  dosage: 1,
  dosage_remaining: 33,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: james.id
)
james_medicine_3.save!

james_medicine_4 = Medicine.new(
  name: "Enalapril",
  description: "An ACE inhibitor used to manage high blood pressure and heart failure.",
  dosage: 2,
  dosage_remaining: 111,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 2,
  user_id: james.id
)
james_medicine_4.save!

james_medicine_5 = Medicine.new(
  name: "Hydrochlorothiazide",
  description: "To treat high blood sugar levels that are caused by a type of diabetes mellitus or sugar diabetes called type 2 diabetes.",
  dosage: 1,
  dosage_remaining: 26,
  unit: "tablets",
  start_date: DateTime.now - Random.rand(10..24),
  end_date: DateTime.now + Random.rand(365..730),
  frequency: 1,
  user_id: james.id
)
james_medicine_5.save!

puts "Created #{Medicine.count} Medicines"
puts "----------------------------------------------"

puts "Creating Supports"

#Creating the supports

# has_many :trusted_users, through: :supports_as_elderly, class_name: "User", foreign_key: :elderly_id

alvin_trusted_user = Support.new(
  elderly_id: alvin.id,
  trusted_user_id: ritsuki.id
)
file = URI.open('db/images/senior-ppl.jpg')
alvin_trusted_user.photo.attach(io: file, filename: 'senior-ppl.jpg', content_type: 'image/jpg')
alvin_trusted_user.save!

james_trusted_user = Support.new(
  elderly_id: james.id,
  trusted_user_id: ritsuki.id
)
file = URI.open('db/images/oldwoman.jpg')
james_trusted_user.photo.attach(io: file, filename: 'oldwoman.jpg', content_type: 'image/jpg')
james_trusted_user.save!

puts "Created #{Support.count} Supports"

# Creating the appointments
puts "----------------------------------------------"
puts "Creating Medical Appointments"

start_time = DateTime.now + rand(1..24).hours
start_time = [start_time.change(hour: 9, min: 0, sec: 0), start_time.change(hour: 18, min: 0, sec: 0)].max

alvin_appointment = Appointment.new(
  name: "Medical Check-up",
  description: "Full body check annually. In particular if any significant changes regarding diabetes",
  start_time: start_time,
  end_time: start_time + rand(1..2).hours,
  address: "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
  latitude: 35.629519458799976,
  longitude: 139.6844641164838,
  user_id: alvin.id
)
alvin_appointment.save!

james_appointment = Appointment.new(
name: "Medical Check-up",
description: "Annual check-up. In particular if any significant changes regarding diabetes",
start_time: start_time,
end_time: start_time + rand(1..4).hours,
address: "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
latitude: 35.629519458799976,
longitude: 139.6844641164838,
user_id: james.id
)
james_appointment.save!

james_appointment2 = Appointment.new(
  name: "Visit Dentist",
  description: "Teeth Whitening",
  start_time: start_time,
  end_time: start_time + rand(1..4).hours,
  address: "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
  latitude: 35.63659824150726,
  longitude: 139.6906442178495,
  user_id: james.id
  )
  james_appointment2.save!

puts "created #{Appointment.count} Medical Appointments"

puts "----------------------------------------------"
puts "Creating Health Records"

# Creating the health records
7.times do |i|
  date = Date.today - (i + 1).days
  alvin_health_record = HealthRecord.new(
    mood_status: rand(1..5),
    weight: rand(45..120),
    sys: rand(100..140),
    dia: rand(60..120),
    pulse: rand(40..80),
    user_id: alvin.id,
    date: date
  )
  alvin_health_record.save!
end

7.times do |i|
  date = Date.today - (i + 1).days
  james_health_record = HealthRecord.new(
    mood_status: rand(1..5),
    weight: rand(45..120),
    sys: rand(100..140),
    dia: rand(60..120),
    pulse: rand(40..80),
    user_id: james.id,
    date: date
  )
  james_health_record.save!
end

puts "Created #{HealthRecord.count} Health Records"

# Creating the reminders

puts "----------------------------------------------"
puts "Creating Reminders"

alvin_reminder_1 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: true,
  medicine_id: alvin_medicine_1.id
)
alvin_reminder_1.save!

alvin_reminder_2 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: true,
  medicine_id: alvin_medicine_2.id
)
alvin_reminder_2.save!

alvin_reminder_3 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: true,
  medicine_id: alvin_medicine_3.id
)
alvin_reminder_3.save!

alvin_reminder_4 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: true,
  medicine_id: alvin_medicine_4.id
)
alvin_reminder_4.save!

alvin_reminder_5 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: true,
  medicine_id: alvin_medicine_5.id
)
alvin_reminder_5.save!

james_reminder_1 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: false,
  medicine_id: james_medicine_1.id
)
james_reminder_1.save!

james_reminder_2 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: false,
  medicine_id: james_medicine_2.id
)
james_reminder_2.save!

james_reminder_3 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: false,
  medicine_id: james_medicine_3.id
)
james_reminder_3.save!


james_reminder_4 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: false,
  medicine_id: james_medicine_4.id
)
james_reminder_4.save!


james_reminder_5 = Reminder.new(
  time_to_taken: DateTime.new(2023, 8, 24, 18, 15),
  dosage: 2,
  taken: false,
  medicine_id: james_medicine_5.id
)
james_reminder_5.save!

puts "Created #{Reminder.count} Reminders"
puts "----------------------------------------------"
