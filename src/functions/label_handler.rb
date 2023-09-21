require_relative 'input_handler'

class LabelHandler
  def self.find_labels(labels, index: false)
    puts 'Sorry, no labels added yet!' if labels.empty?
    puts 'Available labels:' unless index || labels.empty?

    labels.each_with_index do |label, idx|
      display_label(label, idx)
    end

    return unless index

    puts ''
    puts '0 - Create a label'
    puts ''
    InputHandler.get_integer('Choose a label option')
  end

  def self.display_label(label, idx)
    title = label.title.nil? ? 'N/A' : label.title.capitalize
    color = label.color.nil? ? 'N/A' : label.color.capitalize
    puts "#{idx + 1}. Label: #{title}, Color: #{color}"
  end
end
