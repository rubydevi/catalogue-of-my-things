require_relative '../filechecker'
require_relative '../classes/author'
require_relative '../classes/games'


class InputAuthorGame
  def list_of_games
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

  def list_of_authors
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

  def new_game
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
end
