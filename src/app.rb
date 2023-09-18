class App

  ACTIONS = {
    1 => :find_books,
    2 => :find_music_albums,
    3 => :find_games,
    4 => :find_genres,
    5 => :find_labels,
    6 => :find_authors,
    7 => :add_a_book,
    8 => :add_a_music_album,
    9 => :add_a_author,
    10 => :add_a_game,
    0 => :exit
  }.freeze

  def find_books
    Book.display_all_books
  end

  def find_labels
    Label.display_all_labels
  end

  def add_a_book
    Book.add_book
  end

  def find_authors
    Author.list_authors
  end

  def add_a_author
    Author.add_author
  end

  def add_a_game
    Game.add_game
  end

  def find_games
    Game.list_all_games
  end

  def display_interactive_console
    puts "\nPlease choose an option by entering a number:
    1.  List all books
    2.  List all music albums
    3.  List all games
    4.  List all genres
    5.  List all labels
    6.  List all authors
    7.  Add a book
    8.  Add a music album
    9.  Add an author
    10. Add a game
    0.  Exit"
  end
  end
end