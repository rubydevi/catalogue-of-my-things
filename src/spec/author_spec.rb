require_relative '../classes/author'
require_relative '../classes/games'

describe Author do
  let(:author) { Author.new('yonas', 'henok') }
  let(:game) { Game.new('football', true, '2023/09/23', '2010/10/12', author) }

  context 'when testing the Author class instance' do
    it 'should have first_name last_name and random id for the author' do
      # Arrange
      expect(author.first_name).to eq('yonas')
      expect(author.last_name).to eq('henok')
      expect(author.id).to be_between(1, 1000).inclusive
    end
  end

  context 'when testing the Author class' do
    it 'should instance of the class' do
      # Assert
      expect(author).to be_instance_of(Author)
    end

    it 'should instance of the class the items array must be empty []' do
      # Assert
      expect(author.items).to be_empty
    end

    it 'should instance of the class' do
      author.add_item(game)
      # Assert
      expect(author.items).to include(game)
    end
  end
end
