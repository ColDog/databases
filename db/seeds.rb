n = 10
5.times do
  Course.create!({
                   code: "ES#{n}",
                   boat: 'escape',
                   category: 'beginner',
                   size: 16,
                   dates: 'March 20 - 25',
                   year: 2015,
                   price: 330,
                   location: 'Jericho',
                   title: 'Escape Level 1',
                   about: 'A Description'
                 })
  n += 1
end

n = 20
5.times do
  Course.create!({
                   code: "AC#{n}",
                   boat: 'pirate',
                   category: 'intermediate',
                   size: 16,
                   dates: 'March 20 - 25',
                   year: 2015,
                   price: 330,
                   location: 'Jericho',
                   title: 'Cansail Level 1',
                   about: 'A Description'
                 })
  n += 1
end