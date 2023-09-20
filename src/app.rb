require_relative 'classes/author'
require_relative 'classes/games'
require_relative 'filechecker'
require_relative 'store'
require_relative 'functions/add_movie'
require_relative 'functions/list_movies'
require_relative 'functions/list_source'
require_relative 'functions/find_music_albums'
require_relative 'functions/find_genres'
require_relative 'functions/add_a_music_album'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'functions/input_handler'
require_relative 'functions/label_handler'
require_relative 'modules/book_loader'
require_relative 'modules/book_saver'
require_relative 'util/json_storage'



class App
  include DataLoader
  include DataSaver

  def initialize
    @movie = []
    @source = []
    @music_albums = JSONStorage.load_data('music_albums').empty? ? [] : JSONStorage.load_data('music_albums')
    @genres = JSONStorage.load_data('genres').empty? ? [] : JSONStorage.load_data('genres')
    @books = []
    @labels = []
    load_books
    load_labels
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
    list_movies(@movie)
  end

  def find_sources
    list_sources(@source)
  end

  def add_a_movie
    add_movie
  end

  def find_games
    puts "\n"
    all_game = JSON.parse(FileChecker.read_json_file('./data/games.json'))
    all_game.map do |game|
      puts "(Game) name: #{game['name']}, Multiplayer: #{game['multiplayer']}, Game_id: #{game['id']}"
      puts "(Author) frist_name: #{game['author']['first_name']}, Last_name: #{game['author']['last_name']}"
      puts "(Date) last_played_at : #{game['last_played_at']}, published_date: #{game['published_date']}"
      45.times { print '=' }
      puts "\n"
    end
  end

  def find_authors
    puts "\n"
    all_authors = JSON.parse(FileChecker.read_json_file('./data/authors.json'))
    all_authors.map do |author|
      puts "(Author) frist_name: #{author['first_name']}"
      puts "(Author) Last_name: #{author['last_name']}"
      puts "(Author) Author_id: #{author['id']}"
      45.times { print '=' }
      puts "\n"
    end
  end

  # option 6
  def find_labels(index: false)
    LabelHandler.find_labels(@labels, index: index)
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

  def add_a_game
    save = Store.new
    puts 'Add a New Game '
    print 'Enter first name of the author: '
    first_name = gets.chomp
    print 'Enter last name of the author: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    author_data = Author.all
    save.store([author_data[0]], './data/authors.json')
    print 'Enter the name of the game: '
    name = gets.chomp
    print 'Enter Multiplayer [true or false]: '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter the date Last Played At: '
    last_played_at = gets.chomp
    print 'Enter publish date: '
    published_date = gets.chomp
    Game.new(name, multiplayer, last_played_at, published_date, author)
    data = Game.all
    save.store([data[0]], './data/games.json')
    puts 'Game added successfully'
  end

  def exit
    save_books
    save_labels
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
    end
  end
end
