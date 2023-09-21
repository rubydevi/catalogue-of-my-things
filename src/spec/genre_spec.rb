require 'rspec'
require_relative '../classes/genre'
require_relative '../classes/items'
RSpec.describe Genre do
  let(:genre) { Genre.new('Fiction') }

  describe '#initialize' do
    it 'should set the name' do
      expect(genre.name).to eq('Fiction')
    end

    it 'should set the id to a random number between 1 and 100' do
      expect(genre.id).to be_between(1, 100)
    end

    it 'should initialize the items collection as an empty array' do
      expect(genre.items).to eq([])
    end
  end

  describe '#add_item' do
    let(:item) { Items.new(Date.new(2021, 1, 1)) }

    it 'should add the item to the items collection' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'should set the genre of the item to itself' do
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end

  describe '#to_json' do
    it 'should return a JSON string representing the genre' do
      json_string = genre.to_json
      expect(json_string).to be_a(String)

      parsed_json = JSON.parse(json_string)
      expect(parsed_json['name']).to eq('Fiction')
    end
  end

  describe '.json_create' do
    it 'should return a new Genre object initialized with the name from the JSON object' do
      json_string = genre.to_json
      parsed_json = JSON.parse(json_string)
      new_genre = Genre.json_create(parsed_json)

      expect(new_genre.name).to eq('Fiction')
    end
  end
end