class InputHandler
  def self.get_string(prompt)
    puts "#{prompt}: "
    gets.chomp
  end

  def self.get_date(prompt)
    puts "#{prompt} (yyyy-mm-dd): "
    gets.chomp
  end

  def self.get_integer(prompt)
    puts "#{prompt}: "
    gets.chomp.to_i
  end
end
