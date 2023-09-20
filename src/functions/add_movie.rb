require_relative 'add_source'
require_relative '../classes/movie'
require 'json'

def save_movie(collection, filename)
  movie_data = collection.map(&:to_hash)
  File.open(filename, 'w') do |file|
    JSON.dump(movie_data, file)
  end
end

def save_source(source, filename)
  source_data = source.to_hash
  existing_source = load_sources
  existing_source << source_data
  File.open(filename, 'w') do |file|
    JSON.dump(existing_source, file)
  end
end

def add_movie
  puts 'Silent? [Y/N]: '
  silent = gets.chomp.upcase == 'Y'
  puts 'Movie name: '
  name = gets.chomp
  puts 'Published Date?[yyyy-mm-dd]: '
  published_date = gets.chomp.to_s
  movie = Movie.new(silent, name, published_date)
  puts 'Source name: '
  source_name = gets.chomp
  source = Source.new(source_name)
  @source ||= []
  @source << source
  @movie ||= []
  @movie << movie
  puts 'Movie successfully added!'
  save_movie(@movie, './data/movie.json')
  save_source(source, './data/sources.json')
end

# def load_movies
#   filename = './data/movie.json'
#   return [] unless File.exist?(filename)
#   JSON.parse(File.read(filename))
# end

# def list_movies(movies)
#   if movies.empty?
#     puts 'No movies to list'
#     return
#   end

#   puts 'List of movies: '
#   movies.each_with_index do |movie, index|
#     puts "#{index + 1}. Name: #{movie[name]}, Published: #{movie[publish_date]}"
#   end
# end

# @movie = load_movies


# def select_movie
#   puts 'Select movie from the following list: '
#   list_movie
#   gets.chomp.to_i
# end
