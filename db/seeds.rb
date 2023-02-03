5.times do
  user = User.create({email: Faker::Name.name})
end
