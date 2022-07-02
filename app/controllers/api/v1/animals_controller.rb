class  Api::V1::AnimalsController < ApplicationController
  def index
    name = params[:name]
    sex = params[:sex]
    breed = params[:breed]
    age = params[:age]
    if name 
      @animals = Animal.search_name(name)
    elsif sex
      @animals = Animal.search_sex(sex)
    elsif breed
      @animals = Animal.search_breed(breed)
    elsif age
      @animals = Animal.search_age(age)
    else
    @animals = Animal.paginate(page: params[:page], per_page: 10)
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

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      render status: 200, json: {
      message: "This animal has been deleted successfully."
      }
    end
  end
  
  private
  def animal_params
    params.permit(:name, :sex, :breed, :age)
  end
end
