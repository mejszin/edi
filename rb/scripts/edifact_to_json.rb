# ./rb/eancom_to_json.rb <PATH> <LIST OF CONTEXTS>

require './rb/include.rb'

DEBUG_MODE = false

# Return if no valid path argument given
unless (ARGV.length > 0) && (File.exist?(ARGV[0]))
    puts "No valid path argument given"
    return nil
end

# Set values from arguments
path = ARGV[0]
contexts = ARGV.last(ARGV.length - 1)
filename = File.basename(path)

# Parse EDI document
lines = File.readlines(path)
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
message << "- filename: #{filename}"
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

#puts data = document.as_hash()