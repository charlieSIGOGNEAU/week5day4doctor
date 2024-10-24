class City < ApplicationRecord
  has_many :appointments
  has_many :dddoctors
  has_many :patients
end
