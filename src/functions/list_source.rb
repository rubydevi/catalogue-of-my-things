def load_sources
  filename = './data/sources.json'
  return [] unless File.exist?(filename)

  JSON.parse(File.read(filename))
end

def list_sources(_sources_to_list)
  sources = load_sources
  if sources.empty?
    puts 'No Sources to list'
    return
  end

  puts 'List of Sources: '
  sources.each_with_index do |source, index|
    puts "#{index + 1}. Source: #{source['name']}"
  end
end
