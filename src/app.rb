require_relative 'functions/game_author'
require './util/json_storage'
require_relative 'store'
require_relative 'functions/find_music_albums'
require_relative 'functions/find_genres'
require_relative 'functions/add_a_music_album'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'functions/input_handler'

class App
  def initialize
    @music_albums = JSONStorage.load_data('music_albums').empty? ? [] : JSONStorage.load_data('music_albums')
    @genres = JSONStorage.load_data('genres').empty? ? [] : JSONStorage.load_data('genres')
    @books = JSONStorage.load_data('book').empty? ? [] : JSONStorage.load_data('book')
    @labels = JSONStorage.load_data('label').empty? ? [] : JSONStorage.load_data('label')
  end

  ACTIONS = {
    1 => :find_books,
    2 => :find_music_albums,
    3 => :find_movies,
    4 => :find_games,
    5 => :find_genres,
    6 => :find_labels,
    7 => :find_authors,
    8 => :find_sources,
    9 => :add_a_book,
    10 => :add_a_music_album,
    11 => :add_a_movie,
    12 => :add_a_game,
    0 => :exit
  }.freeze

  def find_movies
    puts 'Not implemented yet'
  end

  def find_sources
    puts 'Not implemented yet'
  end

  def add_a_movie
    puts 'Not implemented yet'
  end

  def find_games
    game = InputAuthorGame.new
    game.list_of_games
  end

  def find_authors
    author = InputAuthorGame.new
    author.list_of_authors
  end

  def add_a_game
    add_game = InputAuthorGame.new
    add_game.new_game
  end

  # option 1
  def find_books
    puts 'Sorry, no books found! Press 9 to add a new book' if @books.empty?
    @books.each do |book|
      puts "Publisher: #{book.publisher}(#{book.publish_date}), Cover State: #{book.cover_state} [#{book.label.title}]"
    end
  end

  # option 6
  def find_labels(index: false)
    puts 'Sorry, no labels added yet!' if @labels.empty?
    puts 'Available labels:' unless index || @labels.empty?
    @labels.each_with_index do |label, idx|
      puts "#{idx + 1}. Label: #{label.title.capitalize}, Color: #{label.color.capitalize}"
    end
    return unless index

    puts ''
    puts '0 - Create a label'
    puts ''
    InputHandler.get_integer('Choose a label option')
  end

  # option 9
  def add_a_book
    publish_date = InputHandler.get_date('Publish Date')
    publisher = InputHandler.get_string('Publisher')
    cover_state = InputHandler.get_string('Cover State')

    puts 'Choose a label: '
    label_index = find_labels(index: true)
    label = if label_index.zero?
              create_label
            else
              @labels[label_index - 1]
            end

    new_book = Book.new(publish_date, publisher, cover_state)
    label.add_item(new_book)
    @books << new_book
    puts 'You have successfully added a new book!'
  end

  # option 9.1
  def create_label
    title = InputHandler.get_string('Title')
    color = InputHandler.get_string('Color')
    new_label = Label.new(title, color)
    @labels << new_label
    new_label
  end

  def display_interactive_console
    puts "\nPlease choose an option by entering a number:
      1.  List all books
      2.  List all music albums
      3.  List all movies
      4.  List all games
      5.  List all genres
      6.  List all labels
      7.  List all authors
      8.  List all sources
      9.  Add a book
      10. Add a music album
      11. Add a movie
      12. Add a game
      0.  Exit"
  end

  def run
    entry = -1
    until entry.zero?
      display_interactive_console
      entry = gets.chomp.to_i
      option = ACTIONS[entry]
      option ? send(option) : puts('Invalid input')
      JSONStorage.save_data('music_albums', @music_albums)
      JSONStorage.save_data('genres', @genres)
      JSONStorage.save_data('books', @books)
      JSONStorage.save_data('labels', @labels)
    end
  end
end
