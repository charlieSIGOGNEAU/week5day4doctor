# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Supprime d'abord les rendez-vous, puis les docteurs, patients, spécialités, et enfin les villes
Appointment.destroy_all
DddoctorSpecialty.destroy_all
Dddoctor.destroy_all
Specialty.destroy_all
Patient.destroy_all
City.destroy_all

# Recréation des villes, docteurs, spécialités, etc.
paris = City.create(name: 'Paris')
lyon = City.create(name: 'Lyon')

cardio = Specialty.create(name: 'Cardiologie')
dermato = Specialty.create(name: 'Dermatologie')
generalist = Specialty.create(name: 'Généraliste')
pediatrics = Specialty.create(name: 'Pédiatrie')

d1 = Dddoctor.create(first_name: 'John', last_name: 'Doe', city: paris)
d2 = Dddoctor.create(first_name: 'Jane', last_name: 'Smith', city: lyon)

DddoctorSpecialty.create(dddoctor_id: d1.id, specialty_id: cardio.id)
DddoctorSpecialty.create(dddoctor_id: d1.id, specialty_id: generalist.id)
DddoctorSpecialty.create(dddoctor_id: d2.id, specialty_id: dermato.id)
DddoctorSpecialty.create(dddoctor_id: d2.id, specialty_id: pediatrics.id)

p1 = Patient.create(first_name: 'Alice', last_name: 'Dupont', city: paris)
p2 = Patient.create(first_name: 'Bob', last_name: 'Martin', city: lyon)

appointment1 = Appointment.create(date: DateTime.now + 1.day, dddoctor: d1, patient: p1, city: paris)
appointment2 = Appointment.create(date: DateTime.now + 2.days, dddoctor: d2, patient: p2, city: lyon)
