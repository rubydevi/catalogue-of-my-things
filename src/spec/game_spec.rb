require_relative '../classes/games'
require_relative '../classes/author'

describe Game do
  let(:author) { Author.new('yonas', 'henok') }
  let(:game) { Game.new("football", true, Date.parse("2023/09/23"), Date.parse("2010/10/12"), author) }

  context "when testing the Game class instance" do
    it "should have name, multiplayer, last_played_at, publish_data, author for in Game classs" do
        # Arrange
      expect(game.name).to eq('football')
      expect(game.multiplayer).to be true
      expect(game.last_played_at).to eql(Date.parse("2023/09/23"))
      expect(game.publish_date).to eql(Date.parse("2010/10/12"))
      expect(game.author).to be_instance_of(Author)
    end
  end

  context "when testing the Game class" do
    it "should be instance of the class" do
       # Assert
      expect(game).to be_instance_of(Game)
    end

    it "hould return false if parent's method returns false AND if last_played_at is older than 2 years" do
       # Assert
       expect(game.can_be_archived?).to be false
    end
  end
    
end