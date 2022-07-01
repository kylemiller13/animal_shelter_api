Animal.destroy_all

class Seed
  def self.begin
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    20.times do |i|
      animal = Animal.create!(
        name: Faker::Creature::Dog.name,
        sex: Faker::Creature::Dog.gender,
        breed: Faker::Creature::Dog.breed,
        age: Faker::Number.between(from: 1, to: 30)
      )
      puts "Animal #{i}: This is #{animal.name}, sex is #{animal.sex}, breed is #{animal.breed}, and age is #{animal.age}."
    end
    20.times do |i|
      animal = Animal.create!(
        name: Faker::Creature::Cat.name,
        sex: Faker::Creature::Dog.gender,
        breed: Faker::Creature::Cat.breed,
        age: Faker::Number.between(from: 1, to: 20)
      )
      puts "Animal #{i}: This is #{animal.name}, sex is #{animal.sex}, breed is #{animal.breed}, and age is #{animal.age}."
    end
  end
end

Seed.begin