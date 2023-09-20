require 'json'

module DataSaver
  def save_books
    books_data = []

    @books.each do |book|
      books_data.push({ publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
                        label: { title: book.label.title, color: book.label.color } })
    end
    File.write('data/books.json', JSON.pretty_generate(books_data))
  end

  def save_labels
    labels_data = []
    @labels.each do |label|
      labels_data.push({ title: label.title, color: label.color })
    end
    File.write('data/labels.json', JSON.pretty_generate(labels_data))
  end
end
