FactoryBot.define do
  factory(:animal) do
    name {Faker::Creature::Dog.name}
    sex {Faker::Creature::Dog.gender}
    breed {Faker::Creature::Dog.breed}
    age {Faker::Number.between(from:1, to: 30)}
  end
end