n = 10
5.times do
  Course.create!({
                   code: "ES#{n}",
                   boat: 'Escape',
                   category: 'Beginner',
                   size: 16,
                   dates: 'March 20 - 25',
                   year: 2015,
                   price: 330,
                   location: 'Jericho',
                   title: 'Escape Level 1',
                   about: 'A Description',
                   age_group: '10-14'
                 })
  n += 1
end

n = 20
5.times do
  Course.create!({
                   code: "AC#{n}",
                   boat: 'Pirate',
                   category: 'Intermediate',
                   size: 16,
                   dates: 'March 20 - 25',
                   year: 2015,
                   price: 330,
                   location: 'Jericho',
                   title: 'Cansail Level 1',
                   about: 'A Description',
                   age_group: '10-14'
                 })
  n += 1
end

User.create!({
               name: 'admin',
               email: 'admin@admin.com',
               phone: '7787091959',
               password: 'password',
               password_confirmation: 'password',
               admin: true
             })

User.create!({
               name: 'Jim Johnson',
               email: 'jim@test.com',
               phone: '7787091959',
               password: 'password',
               password_confirmation: 'password'
             })

User.create!({
               name: 'Colin Walker',
               email: 'colin@test.com',
               phone: '6042243456',
               password: 'password',
               password_confirmation: 'password'
             })

User.create!({
               name: 'Jimbo Walker',
               email: 'Jimbo@test.com',
               phone: '6045567890',
               password: 'password',
               password_confirmation: 'password'
             })