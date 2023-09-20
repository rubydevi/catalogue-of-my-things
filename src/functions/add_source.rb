require_relative '../classes/source'

def add_source
  puts 'Please enter source: '
  name = gets.chomp
  source = Source.new(name)
  @source << source
  puts 'Source added successfully!'
end

def list_source
  @source.each_with_index do |source, index|
    puts "#{index + 1}. #{source.name}"
  end
end

def select_source
  puts 'Select source from the following list: '
  list_source
end 

