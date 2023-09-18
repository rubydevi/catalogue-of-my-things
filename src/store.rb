class Store
    def store(arr, data)
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
    
      def store_game(arr)

        if File.exist?('./data/games.json')
          file = File.read('./data/games.json')
          data = JSON.parse(file)
        else
          data = []
        end
    
        if !File.exist?('./data/games.json')
        File.new('./data/games.json', 'w+') 
        end
      File.write('./data/games.json', JSON.dump(store(arr, data)))
      end
end