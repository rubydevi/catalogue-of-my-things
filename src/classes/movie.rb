require_relative 'items'

class Movie < Items
  attr_accessor :silent, :publish_date
  attr_reader :id, :name

  def initialize(silent, name, publish_date)
    super(publish_date)
    @silent = silent
    @name = name
  end

  def can_be_archived?
    super || @silent
  end

  def to_hash
    {
      id: @id,
      name: @name,
      silent: @silent,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
