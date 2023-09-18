require_relative 'items'

class Movie < Items
  attr_accessor :silent, :publish_date
  attr_reader :id

  def initialize(silent, publish_date)
    super(publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
