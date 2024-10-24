class Boost < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.timestamps
      t.string :name
    end
    create_table :specialties do |t|
      t.timestamps
      t.string :name
      t.belongs_to :dddoctor, index: true
    end
    create_table :dddoctor_specialties do|t|
      t.timestamps
      t.belongs_to :dddoctor, index: true
      t.belongs_to :specialty, index: true
    end
    add_reference :dddoctors, :city, foreign_key: true
    add_reference :patients, :city, foreign_key: true
    add_reference :appointments, :city, foreign_key: true
    remove_column :dddoctors, :specialty
  end
end
