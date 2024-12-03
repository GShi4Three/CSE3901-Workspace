# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create!(name: 'John', email: 'test@test', password: 'test', role: 'student')
userTA = User.create!(name: 'ta', email: 'ta@ta', password: 'ta', role: 'ta')

presentation = Presentation.create!(name: 'AI in Healthcare', image: 'https://placehold.co/400x300', score: 8.5)

presentation.users << user