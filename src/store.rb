class Store
  def store_game(arr, data)
    arr.each do |game|
      data.push({
                  id: game.id,
                  name: game.name,
                  multiplayer: game.multiplayer,
                  last_played_at: game.last_played_at,
                  author: {
                    id: game.author.id,
                    first_name: game.author.first_name,
                    last_name: game.author.last_name
                  },
                  published_date: game.publish_date
                })
    end
    data
  end

  def store_author(arr, data)
    arr.each do |author|
      data.push({
                  id: author.id,
                  first_name: author.first_name,
                  last_name: author.last_name
                })
    end
    data
  end

  def store(arr, path)
    if File.exist?(path)
      file = File.read(path)
      data = JSON.parse(file)
    else
      data = []
    end

    File.new(path, 'w+') unless File.exist?(path)

    case path
    when './data/games.json'
      File.write(path, JSON.dump(store_game(arr, data)))
    when './data/authors.json'
      File.write(path, JSON.dump(store_author(arr, data)))
    end
  end
end
