def load_movies
  filename = './data/movie.json'
  return [] unless File.exist?(filename)

  JSON.parse(File.read(filename))
end

def list_movies(_movies_to_list)
  movies = load_movies
  if movies.empty?
    puts 'No movies to list'
    return
  end

  puts 'List of movies: '
  movies.each_with_index do |movie, index|
    puts "#{index + 1}. Name: #{movie['name']}, Published: #{movie['publish_date']}"
  end
end
