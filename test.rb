require 'json'

# Define a method to save data to JSON files
def save_to_json(collection, filename)
  File.open(filename, 'w') do |file|
    JSON.dump(collection, file)
  end
end

# Define a method to load data from JSON files
def load_from_json(filename)
  return [] unless File.exist?(filename)
  
  JSON.parse(File.read(filename))
end

# Initialize an empty array to store user input data
user_input_data = []

# Collect user input data
loop do
  puts "Enter movie data (or 'q' to quit):"
  print "Title: "
  title = gets.chomp
  break if title.downcase == 'q'
  
  print "Director: "
  director = gets.chomp
  
  print "Year: "
  year = gets.chomp.to_i
  
  print "Genre: "
  genre = gets.chomp
  puts 'movie added successfully'
  
  movie_data = {
    title: title,
    director: director,
    year: year,
    genre: genre
  }
  
  user_input_data << movie_data
end

# Save user input data to a JSON file
save_to_json(user_input_data, 'user_data.json')

# Load user input data from the JSON file
loaded_user_data = load_from_json('user_data.json')

# Display the loaded data
puts "Loaded user data:"
puts loaded_user_data
