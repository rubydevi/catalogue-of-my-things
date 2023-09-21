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
end
