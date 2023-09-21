require_relative '../classes/book'

describe Book do
  let(:book) { Book.new(Date.parse('2005-9-9'), 'Tudor', 'good') }

  context '#initialize' do
    it 'should create a new book' do
      expect(book).to be_a(Book)
    end
  end

  context '#can_be_archived?' do
    it 'when the cover state is not "bad" returns true if the parent method returns true' do
      expect(book.can_be_archived?).to be true
    end

    it 'when the cover state is "bad" returns true' do
      book.cover_state = 'bad'
      expect(book.can_be_archived?).to be true
    end
  end
end
