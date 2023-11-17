require 'json'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'])
  end
end
