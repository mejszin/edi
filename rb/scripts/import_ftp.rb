#!/usr/bin/ruby

require './rb/include.rb'

DEBUG_MODE = true

puts "HELLO WORLD!!! - Ruby"

dir_path = "/home/ftpuser/ftp/"

Dir.foreach(dir_path) do |file_path|
    unless file_path == '.' || file_path == '..'
        if ['.txt'].include?(File.extname(file_path))
            full_path = File.join(dir_path, file_path)
            lines = File.readlines(full_path)
            puts lines.inspect
            File.delete(full_path)
            translate(full_path, lines)
        end
    end
end

def translate(file_path, lines)
    contexts = []

    # Parse EDI document
    document = Document.new(lines)

    # Get contextual information from EDI document
    context = []
    document.context().each do |datum|
        key, value = datum.first
        context << [key, value] if contexts.include?(key) || contexts.empty?
    end

    # Create console message
    message = []
    message << "Successfully uploaded EDI message"
    message << "- filename: #{File.basename(file_path)}"
    message << "- message_type: #{document.type()}"
    context.each do |key, value|
        message << "- #{key}: #{value}"
    end

    # Send information to Firebase console
    unless DEBUG_MODE
        console = Console.new
        console.add_lines(message, "UPLOAD")
    else
        puts message
    end

    # Write JSON
    write_path = File.basename(file_path, File.extname(file_path)) + ".json"
    File.write(write_path, document.as_hash().to_json) 
end