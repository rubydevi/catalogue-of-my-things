require_relative 'items'

class Book < Items
  attr_accessor :publisher, :cover_state, :publish_date
  attr_reader :id

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    # Override the parent method and add condition
    super || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    Book.new(data['publish_date'], data['publisher'], data['cover_state'])
  end
end
