class Initialisation < ActiveRecord::Migration[7.2]
  def change
    create_table :dddoctors do |t|
      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :specialty
      t.string :zip_code
    end
    create_table :patients do |t|
      t.timestamps
      t.string :first_name
      t.string :last_name
    end
    create_table :appointments do |t|
      t.timestamps
      t.datetime :date
      t.belongs_to :dddoctor, index: true
      t.belongs_to :patient, index: true
    end
  end
end
