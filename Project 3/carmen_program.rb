require 'dotenv'
require 'httparty'
require 'json'
# Loading the environmental variables from the Project 3 folder
Dotenv.load('Project 3/.env')
# Access token from .env file
TOKEN = ENV['CANVAS_TOKEN']
# Base URL for Carmen Canvas
BASE_URL = 'https://osu.instructure.com/api/v1'

# API call for course history
def get_courses
  response = HTTParty.get(
    "#{BASE_URL}/courses?per_page=100",
    headers: {
      "Authorization" => "Bearer #{TOKEN}"
    }
  )
  # Checking if the response is valid or not
  if response.code == 200
    #puts response.body
    return JSON.parse(response.body)
  else
    return []
  end
end

# API call for todo list
def get_todos
  response = HTTParty.get(
    "#{BASE_URL}/users/self/todo",
    headers: {
      "Authorization" => "Bearer #{TOKEN}"
    }
  )
  # Checking if the response is valid or not
  if response.code == 200
    #puts response.body
    return JSON.parse(response.body)
  else
    return []
  end
end

# API call for conversation history
def get_conversations
  response = HTTParty.get(
    "#{BASE_URL}/conversations",
    headers: {
      "Authorization" => "Bearer #{TOKEN}"
    }
  )
  # Checking if the response is valid or not
  if response.code == 200
    #puts response.body
    return JSON.parse(response.body)
  else
    return []
  end
end


# Fetch courses from the API
courses = get_courses

# Fetch todo items from the API
todos = get_todos

# Fetch conversations from the API
conversations = get_conversations

# Read the existing HTML template
html_template = File.read('Project 3/display_page.html')

# Inject course data into the HTML template
course_rows = courses.map do |course|
  name = course['name'] || 'Unknown' 
  id = course['id'] || 'Unknown'  
  course_code = course['course_code'] || 'Unknown' 
  "<tr>
    <td>#{name}</td>
    <td>#{id}</td>
    <td>#{course_code}</td>
  </tr>"
end.join("\n")

# Inject todo list data into the HTML template
todo_rows = todos.map do |todo|
  type = todo['type']
  course = todo['context_name']
  "<tr>
    <td>#{type}</td>
    <td>#{course}</td>
  </tr>"
end.join("\n")

# Inject conversation data into the HTML template
conversations_rows = conversations.map do |conversation|
  subject = conversation['subject']
  status = conversation['workflow_state']
  course = conversation['context_name']
  "<tr>
    <td>#{subject}</td>
    <td>#{status}</td>
    <td>#{course}</td>
  </tr>"
end.join("\n")

# Replacing HTML with data
html_output = html_template
  .sub('<tbody> <!-- Course list will go here --> ', "<tbody>\n#{course_rows}")
  .sub('<tbody> <!-- Todo list will go here --> ', "<tbody>\n#{todo_rows}")
  .sub('<tbody> <!-- Conversations will go here --> ', "<tbody>\n#{conversations_rows}")

# Writing the updated HTML to a new file
File.open('Project 3/updated_display_page.html', 'w') do |file|
  file.write(html_output)
end

# Printing out confirmation
puts "HTML file generated: updated_display_page.html"