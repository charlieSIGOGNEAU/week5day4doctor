class Patient < ApplicationRecord
  has_many :appointments
  has_many :dddoctors, through: :appointments
  belongs_to :city
end
