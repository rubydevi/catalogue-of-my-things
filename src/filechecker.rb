require 'json'

# checks if file exists
class FileChecker
  def self.read_json_file(file_path)
    return [] unless File.exist?(file_path)

    File.read(file_path)
  end

  def self.file_exists?(file_path)
    File.exist?(file_path)
  end
end
