class Source
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1..100)
    @name = name
    @items = []
  end

  def to_hash
    {
      id: @id,
      name: @name
    }
  end

  def add_item(item)
    item.source = self
    @items << item
  end
end
