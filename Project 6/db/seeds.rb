# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users
user1 = User.create!(name: 'John Doe', email: 'john@example.com', password: 'password', role: 'Student')
user2 = User.create!(name: 'Jane Smith', email: 'jane@example.com', password: 'password', role: 'TA')

# Create Presentations
presentation = Presentation.create!(name: 'AI in Healthcare', image: 'ai_healthcare.jpg', score: 8.5)

# Assign Users as Creators
presentation.users << user1
presentation.users << user2

# Create Evaluations
Evaluation.create!(content_score: 9, organization_score: 8, time_pacing_score: 7, professionalism_score: 9, comments: 'Great presentation!', user: user1, presentation: presentation)
Evaluation.create!(content_score: 8, organization_score: 9, time_pacing_score: 8, professionalism_score: 10, comments: 'Well-organized!', user: user2, presentation: presentation)
