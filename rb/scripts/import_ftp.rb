#!/usr/bin/ruby

puts "HELLO WORLD!!! - Ruby"

dir_path = "/home/ftpuser/ftp/"

Dir.foreach(dir_path) do |file_path|
    unless file_path == '.' || file_path == '..'
        if ['.txt'].include?(File.extname(file_path))
            full_path = File.join(dir_path, file_path)
            lines = File.readlines(full_path)
            puts lines.inspect
            File.delete(full_path)
        end
    end
end