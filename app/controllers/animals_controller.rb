class AnimalsController < ApplicationController
  def index 
    if params[:name].present?
      name = params[:name]
      @animals = Animal.search_name(name)
    elsif params[:sex].present?
      sex = params[:sex]
      @animals = Animal.search_sex(sex)
    elsif params[:breed].present?
      breed = params[:breed]
      @animals = Animal.search_breed(breed)
    elsif paramas[:age].present?
      age = paramas[:age]
      @animals = Animal.search_age(age)
    else 
      @animals = Animal.order('name ASC').paginate(:page => params[:page], per_page:10)
    end
    json_response(@animals)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal, :created)
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update!(animal_params)
      render status: 200, json: {
        message: "This animal has been updated successfully."
      }
    end
end
