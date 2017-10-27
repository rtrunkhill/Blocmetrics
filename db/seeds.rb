5.times do
    RegisterApp.create!(
        name: Faker::GameOfThrones.character,
        url:  Faker::Internet.domain_name,
        user_id: Faker::Number.between(1, 2)
    )
end

15.times do
    Event.create!(
    name: Faker::GameOfThrones.house,
    register_app_id: Faker::Number.between(1, 5)
    )
end



puts "Seeds finished"
puts "#{RegisterApp.count} Registered Apps created"
puts "#{Event.count} Events created"