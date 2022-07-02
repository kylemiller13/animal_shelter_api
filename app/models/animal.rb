class Animal < ApplicationRecord
  validates :name, :presence => true 
  validates :sex, :presence => true
  validates :breed, :presence => true
  validates :age, numericality: { only_integer: true }
  scope :search_name, -> (name_parameter) { where("name ilike ?", "#{name_parameter}")}
  scope :search_sex, -> (sex_parameter) { where("sex ilike ?", "#{sex_parameter}")}
  scope :search_breed, -> (breed_parameter) { where("breed ilike ?", "#{breed_parameter}")}
  scope :search_age, -> (age_parameter) { where("age = ?", "#{age_parameter}")}

  before_save(:titleize_animal)

  private

  def titleize_animal
    self.name = self.name.titleize
  end
end