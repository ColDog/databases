# courses
a = 10
10.times do
  Course.create!({code: "ES#{a}", boat: 'Escape', category: 'Beginner', size: 16,
                  dates: 'March 20 - 25', start_date: Faker::Time.forward(23, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'Escape Level 1',
                  about: 'A Description', age_group: '10-14' })
  a += 1
end

b = 10
10.times do
  Course.create!({code: "CS#{b}", boat: 'Pirate', category: 'Beginner', size: 16,
                  dates: 'March 20 - 25', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'CanSail Level 1',
                  about: 'A Description', age_group: '11-16' })
  b += 1
end

c = 10
10.times do
  Course.create!({code: "AD#{c}", boat: 'Pirate', category: 'Beginner', size: 16,
                  dates: 'March 20 - 25', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'CanSail Level 1',
                  about: 'A Description', age_group: 'Adult' })
  c += 1
end

d = 10
5.times do
  Course.create!({code: "BC#{d}", boat: 'Advanced', category: 'Beginner', size: 16,
                  dates: 'March 20 - 25', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Kitsilano', title: 'Basic Cruising 1',
                  about: 'A Description', age_group: 'Adult' })
  d += 1
end

e = 20
10.times do
  Course.create!({code: "DS#{e}", boat: 'Pirate', category: 'Beginner', size: 16,
                  dates: 'March 20 - 25', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'CanSail Level 2',
                  about: 'A Description', age_group: 'Adult' })
  e += 1
end

# users
25.times do
  User.create({name: Faker::Name.name, email: Faker::Internet.email,
               phone: Faker::PhoneNumber.phone_number, age: 25, health_notes: 'very unhealthy',
               password: 'password', password_confirmation: 'password', activated: true, waiver: false
              })
end

25.times do
  User.create({name: Faker::Name.name, email: Faker::Internet.email,
               phone: Faker::PhoneNumber.phone_number, age: 25, health_notes: 'very unhealthy',
               password: 'password', password_confirmation: 'password', activated: true, waiver: true
              })
end

25.times do
  User.create({name: Faker::Name.name, email: Faker::Internet.email,
               phone: Faker::PhoneNumber.phone_number, age: 25, health_notes: 'very unhealthy',
               password: 'password', password_confirmation: 'password', activated: false, waiver: true
              })
end

# admin user
User.create({name: 'Admin', email: 'admin@admin.com', phone: '6042247245', password: 'password', password_confirmation: 'password', admin: true})
User.create({name: 'Test User', email: 'test@test.com', phone: '6042247245', password: 'password', password_confirmation: 'password', admin: false, activated: true})

# class sign ups
u = 1
16.times do
  ClassList.create!({course_id: 1, user_id: u, paid: false})
  u += 1
end

u = 1
16.times do
  ClassList.create!({course_id: 2, user_id: u, paid: false})
  u += 1
end

u = 1
16.times do
  ClassList.create!({course_id: 3, user_id: u, paid: false})
  u += 1
end

u = 1
16.times do
  ClassList.create!({course_id: 4, user_id: u, paid: false})
  u += 1
end


