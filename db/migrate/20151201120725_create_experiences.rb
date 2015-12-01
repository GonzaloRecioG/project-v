class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.date :day
      t.string :duration
      t.string :category

      t.timestamps null: false
    end
  end
end
