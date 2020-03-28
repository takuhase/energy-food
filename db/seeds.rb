20.times do |n|
  name  = Faker::JapaneseMedia::DragonBall.character
  email = "example-#{n+1}@energyfood.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end
