class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :sex
      t.string :breed
      t.integer :age

      t.timestamps
    end
  end
end
