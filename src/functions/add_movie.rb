require_relative 'add_source'
require_relative '../classes/movie'
require 'json'

def save_movie(collection, filename)
  existing_movies = load_movies || []
  movie_data = collection.map(&:to_hash)
  merged_data = existing_movies + movie_data
  File.open(filename, 'w') do |file|
    JSON.dump(merged_data, file)
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
