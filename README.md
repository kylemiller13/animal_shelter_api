# Animal Shelter

#### By Kyle Miller

## Technologies Used

* Ruby-on-Rails
* PSQL 
* Ruby Gems:
* Rspec
* Pry
* Faker
* shoulda-matchers
* Will Paginate
* Factory Bot

## Description:
_This project was created to demonstrate my understanding of how to create an API for a local animal shelter. This API that allows users to retrieve information about animals in a shelter including name, sex, breed, age. The user can add/remove/edit/search animals in the database._

## Setup/Installation Requirements for Windows

* Clone or download this repository onto your desktop.
* Navigate to the top-level of directory.
* Open VScode.
* Type "bundle" to install the gems
* In `Config/database.yml` file, add username & password to the `development:`, `test:`, & `production:`
* An Example:  
```
development:
  <<: *default
database: marios-food_development
username: <%= ENV['POSTGRES_USERNAME'] %> 
password: <%= ENV['POSTGRES_PASSWORD'] %> 
```
* **To Run the App**:  
  1. `rake db:create`
  2. `rake db:test:prepare`
  3. `rake db:migrate`
  4. `rake db:seed`
  5. Run `pg_ctl start` in the terminal to run a server.
  6. Then run `rails s` to start up rails.
* **To Run Tests**: In the root directory of this project, run `rspec` in your command line.

## API Endpoints

|Usage | METHOD       | URL       | Params |
| :--------| :------------| :---------| :------|
|See Animals | GET    | `http://localhost:3000/api/v1/animals` | |
|See Animals (Paginated) | GET    | `http://localhost:3000/api/v1/animals?page=param` | _page_ |
|See A Specific Animal | GET    | `http://localhost:3000/api/v1/animals/:id` | |
|Search By Animal Name | GET    | `http://localhost:3000/api/v1/animals?name=param` | _name_ |
|Search By Animal Sex | GET    | `http://localhost:3000/api/v1/animals?sex=param` | _sex_ |
|Search By Animal Breed | GET    | `http://localhost:3000/api/v1/animals?sex=param` | _breed_ |
|Search By Animal Age | GET    | `http://localhost:3000/api/v1/animals?sex=param` | _age_ |
|Create An Animal | POST    | `http://localhost:3000/api/v1/animals?name=param&sex=param&breed=param&age=param` | _name, sex, breed, age_ |
|Update An Animal (any or all parameters) | PUT    | `http://localhost:3000/api/v1/animals/:id?name=param&sex=param&breed=param&age=param` | _name, sex, breed, age_ |
|Delete An Animal | DELETE    |`http://localhost:3000/api/v1/animals/:id`| |  
|||||

## Known Bugs

- _N/A_

## License

- _[MIT](https://opensource.org/licenses/MIT)_
- N/A Copyright (c) 7/3/2022, Kyle Miller
