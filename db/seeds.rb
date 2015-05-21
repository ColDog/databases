a = 10
30.times do
  Course.create!({code: "ES#{a}", boat: 'Escape', category: 'Beginner', size: 16,
                  dates: 'Mon - Fri 1-4', start_date: Faker::Time.forward(23, :morning),
                  end_date: 1.year.from_now, year: 2015, price: 330,
                  location: 'Jericho', title: 'Escape Level 1', about: 'A Description',
                  age_group: '10-14' })
  a += 1
end

f = 10
20.times do
  Course.create!({code: "EA#{f}", boat: 'Escape', category: 'Beginner', size: 16,
                  dates: 'Mon - Fri 1-4', start_date: Faker::Time.forward(23, :morning),
                  end_date: 1.year.from_now, year: 2015, price: 330,
                  location: 'Jericho', title: 'Escape Level 1', about: 'A Description',
                  age_group: '10-14' })
  f += 1
end

b = 10
40.times do
  Course.create!({code: "CS#{b}", boat: 'Pirate', category: 'Beginner', size: 16,
                  dates: 'Mon - Fri 1-4', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'CanSail Level 1',
                  about: 'A Description', age_group: '11-16', end_date: 1.year.from_now, })
  b += 1
end

c = 10
30.times do
  Course.create!({code: "AD#{c}", boat: 'Pirate', category: 'Beginner', size: 16,
                  dates: 'Mon - Fri 1-4', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'CanSail Level 1',
                  about: 'A Description', age_group: 'Adult', end_date: 1.year.from_now, })
  c += 1
end

d = 10
10.times do
  Course.create!({code: "BC#{d}", boat: 'Advanced', category: 'Beginner', size: 16,
                  dates: 'Mon - Fri 1-4', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Kitsilano', title: 'Basic Cruising 1',
                  about: 'A Description', age_group: 'Adult', end_date: 1.year.from_now, })
  d += 1
end

e = 20
20.times do
  Course.create!({code: "DS#{e}", boat: 'Advanced', category: 'Beginner', size: 16,
                  dates: 'March 20 - 25', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'CanSail Level 2',
                  about: 'A Description', age_group: 'Adult', end_date: 1.year.from_now, })
  e += 1
end

g = 10
50.times do
  Course.create!({code: "OP#{g}", boat: 'Opti', category: 'Beginner', size: 16,
                  dates: 'Mon - Fri 1-5', start_date: Faker::Time.forward(50, :morning),
                  year: 2015, price: 330, location: 'Jericho', title: 'CanSail Level 2',
                  about: 'A Description', age_group: 'Adult', end_date: 1.year.from_now, })
  g += 1
end




# users
1000.times do
  User.create!({name: Faker::Name.name, email: Faker::Internet.email,
               phone: Faker::Number.number(10), age: 25, health_notes: 'very unhealthy',
               password: 'password', password_confirmation: 'password', activated: true, waiver: false
              })
end

1000.times do
  User.create!({name: Faker::Name.name, email: Faker::Internet.email,
               phone: Faker::Number.number(10), age: 25, health_notes: 'very unhealthy',
               password: 'password', password_confirmation: 'password', activated: true, waiver: true
              })
end

1000.times do
  User.create!({name: Faker::Name.name, email: Faker::Internet.email,
               phone: Faker::Number.number(10), age: 25, health_notes: 'very unhealthy',
               password: 'password', password_confirmation: 'password', activated: false, waiver: true
              })
end

User.create!({name: 'Admin', email: 'admin@admin.com', phone: '6042247245', password: 'password', password_confirmation: 'password', admin: true, activated: true})
User.create!({name: 'Test User', email: 'test@test.com', phone: '6042247245', password: 'password', password_confirmation: 'password', admin: false, activated: true})



