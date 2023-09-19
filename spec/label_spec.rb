require_relative '../src/label'
require_relative '../src/book'

describe Label do
  let(:label) { Label.new('Gift', 'Blue') }
  let(:item) { double('Item') }
  let(:book) { Book.new(Date.new(2005, 9, 9), 'ABS Book', 'good') }

  context '#initialize' do
    it 'initializes a Label object with a random id, title, color, and an empty items array' do
      expect(label.id).to be_a(Integer)
      expect(label.title).to eq('Gift')
      expect(label.color).to eq('Blue')
      expect(label.items).to be_empty
    end
  end

  context '#add_item' do
    it 'adds an item to the collection of items' do
      label.add_item(book)
      expect(label.items).to include(book)
    end

    it 'sets self as a property of the item object' do
      expect(item).to receive(:label=).with(label)
      label.add_item(item)
    end
  end
end
