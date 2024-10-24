class Appointment < ApplicationRecord
  belongs_to :dddoctor
  belongs_to :patient
  belongs_to :city
end
