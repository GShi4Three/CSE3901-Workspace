require 'dotenv/load'
require 'httparty'
require 'json'

Dotenv.load('Project 3/.env')

# Access token from .env file
TOKEN = ENV['CANVAS_TOKEN']
puts ENV['CANVAS_TOKEN']

BASE_URL = 'https://osu.instructure.com/api/v1'

def get_courses
  response = HTTParty.get(
    "#{BASE_URL}/courses",
    headers: {
      "Authorization" => "Bearer #{TOKEN}"
    }
  )

  if response.code == 200
    courses = JSON.parse(response.body)
    courses.each do |course|
      puts "Course: #{course['name']}, Course ID: #{course['id']}"
    end
  else
    puts "Error: #{response.code} - #{response.message}"
  end
end

# Call the method to get courses
get_courses
