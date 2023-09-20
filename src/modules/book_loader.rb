require 'json'

module DataLoader
  def load_books
    File.new('data/books.json', 'w') unless File.exist?('data/books.json')
    books_data = File.read('data/books.json')
    return if books_data.empty?

    books_array = JSON.parse(books_data)

    books_array.each do |book_data|
      publish = book_data['publish_date'].split('-')
      book = Book.new(
        Date.new(publish[0].to_i, publish[1].to_i, publish[2].to_i),
        book_data['publisher'],
        book_data['cover_state']
      )

      # Load the associated label if it exists in the JSON data
      if book_data['label']
        label_data = book_data['label']
        label = Label.new(label_data['title'], label_data['color'])
        book.label = label
      end

      @books.push(book)
    end
  end

  def load_labels
    File.new('data/labels.json', 'w') unless File.exist?('data/labels.json')
    labels = File.read('data/labels.json')
    return if labels.empty?

    JSON.parse(labels).each do |label|
      @labels.push(Label.new(label['title'], label['color']))
    end
  end
end
