namespace :db do
  task signup: :environment do
    1000.times do
      c = rand(0..200)
      u = rand(0..3000)
      signup = ClassList.new(course_id: c, user_id: u)
      if signup.valid?
        ClassList.create({course_id: c, user_id: u })
      end
    end
  end
end