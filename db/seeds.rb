n = 10
10.times do
  Course.create!({
                   code: "ES#{n}",
                   boat: 'Escape',
                   category: 'Beginner',
                   size: 16,
                   dates: 'March 20 - 25',
                   start_date: Date.today,
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
10.times do
  Course.create!({
                   code: "AC#{n}",
                   boat: 'Pirate',
                   category: 'Intermediate',
                   size: 16,
                   dates: 'March 20 - 25',
                   start_date: Date.today,
                   year: 2015,
                   price: 330,
                   location: 'Jericho',
                   title: 'Cansail Level 1',
                   about: 'A Description',
                   age_group: '7-10'
                 })
  n += 1
end

25.times do
  Course.create!({
                   code: "AD#{n}",
                   boat: 'Pirate',
                   category: 'Beginner',
                   size: 16,
                   dates: 'March 20 - 25',
                   start_date: Date.today,
                   year: 2015,
                   price: 330,
                   location: 'Jericho',
                   title: 'Cansail Level 1',
                   about: 'A Description',
                   age_group: 'Adult'
                 })
  n += 1
end

10.times do
  Course.create!({
                   code: "AC#{n}",
                   boat: 'Pirate',
                   category: 'Intermediate',
                   size: 16,
                   dates: 'March 20 - 25',
                   start_date: Date.today,
                   year: 2015,
                   price: 330,
                   location: 'Jericho',
                   title: 'Cansail Level 2',
                   about: 'A Description',
                   age_group: 'Adult'
                 })
  n += 1
end


User.create!({id: 1,name:'Colin',email:'admin@admin.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:true})
User.create!({id: 2,name:'Colin',email:'foo@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id: 3,name:'Jim',email:'bar@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id: 4,name:'Jones',email:'bin@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id: 5,name:'Jimbo',email:'bite@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id: 6,name:'Jim',email:'b@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id: 7,name:'James',email:'a@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id: 8,name:'Jord',email:'s@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id: 9,name:'John',email:'d@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id:10,name:'John',email:'f@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:true,waiver:true,admin:false})
User.create!({id:11,name:'John',email:'g@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:false,waiver:false,admin:false})
User.create!({id:12,name:'John',email:'h@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:false,waiver:false,admin:false})
User.create!({id:13,name:'John',email:'i@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:false,waiver:false,admin:false})
User.create!({id:14,name:'John',email:'j@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:false,waiver:false,admin:false})
User.create!({id:15,name:'John',email:'k@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:false,waiver:false,admin:false})
User.create!({id:16,name:'John',email:'l@test.com',phone:'6045567890',password:'password',password_confirmation:'password',activated:false,waiver:false,admin:false})

ClassList.create!({course_id: 2, user_id: 2, paid: true})
ClassList.create!({course_id: 3, user_id: 2, paid: true})
ClassList.create!({course_id: 4, user_id: 2, paid: false})
ClassList.create!({course_id: 5, user_id: 2, paid: false})
ClassList.create!({course_id: 2, user_id: 6, paid: false})
ClassList.create!({course_id: 10, user_id: 6, paid: false})
ClassList.create!({course_id: 2, user_id: 5, paid: true})
ClassList.create!({course_id: 3, user_id: 6, paid: false})
ClassList.create!({course_id: 4, user_id: 7, paid: false})
ClassList.create!({course_id: 6, user_id: 4, paid: true})
ClassList.create!({course_id: 7, user_id: 5, paid: false})
ClassList.create!({course_id: 8, user_id: 6, paid: false})
ClassList.create!({course_id: 9, user_id: 7, paid: true})

ClassList.create!({course_id: 1, user_id: 1, paid: false})
ClassList.create!({course_id: 1, user_id: 2, paid: false})
ClassList.create!({course_id: 1, user_id: 3, paid: false})
ClassList.create!({course_id: 1, user_id: 4, paid: false})
ClassList.create!({course_id: 1, user_id: 5, paid: false})
ClassList.create!({course_id: 1, user_id: 6, paid: false})
ClassList.create!({course_id: 1, user_id: 7, paid: false})
ClassList.create!({course_id: 1, user_id: 8, paid: false})
ClassList.create!({course_id: 1, user_id: 9, paid: false})
ClassList.create!({course_id: 1, user_id: 10, paid: false})
ClassList.create!({course_id: 1, user_id: 11, paid: false})
ClassList.create!({course_id: 1, user_id: 12, paid: false})
ClassList.create!({course_id: 1, user_id: 13, paid: false})
ClassList.create!({course_id: 1, user_id: 14, paid: false})
ClassList.create!({course_id: 1, user_id: 15, paid: false})
ClassList.create!({course_id: 1, user_id: 16, paid: false})





