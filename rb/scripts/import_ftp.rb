#!/usr/bin/ruby

puts "HELLO WORLD!!! - Ruby"

dir_path = "/home/ftpuser/ftp/"
Dir.foreach(dir_path) do |f|
    fn = File.join(dir_path, f)
    File.delete(fn) if f != '.' && f != '..' && "entr.txt"
end