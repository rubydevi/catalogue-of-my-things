require_relative 'items'

class Game < Items
  attr_accessor :name, :multiplayer, :last_played_at, :publish_date, :author

  def initialize(name, multiplayer, last_played_at, publish_date, author)
    super(publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
  end

  def can_be_archived?
    super && Time.now.year - @last_played_at.year > 2
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end


