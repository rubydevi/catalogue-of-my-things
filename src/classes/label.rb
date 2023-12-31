class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    # Set self as a property of the item object
    item.label = self
  end
end
