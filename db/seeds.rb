# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# Uncomment the following to create an Admin user for Production in Jumpstart Pro
# User.create name: "name", email: "email", password: "password", password_confirmation: "password", admin: true, terms_of_service: true

company_area = CompanyArea.create(name: "Tecnologia")
User.create(
  name: "Bruno Campos",
  email: "bruno@accreditaire.com",
  password: "foobar",
  password_confirmation: "foobar",
  company_area: company_area,
  admin: true,
  terms_of_service: true
)
