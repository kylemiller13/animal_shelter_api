require 'rails_helper'

RSpec.describe Animal, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :sex }
  it { should validate_presence_of :breed }
  it { should validate_numericality_of(:age).only_integer }
end