# Inspect EDIFACT message
# rb/inspect.rb <MESSAGE_PATH>

require './rb/include.rb'

# Return if no arguments
if ARGV.length == 0
    puts "rb/inspect.rb <MESSAGE_PATH> -json"
    return
else
    file_path = ARGV[0]
end

# Return if invalid file path
unless File.file?(file_path)
    puts "Invalid file path \"#{root_path}\"."
    return
end

# Get ARGV information
show_json = (ARGV[1] == "-json") if ARGV.length > 1

# Parse EDI document
lines = File.readlines(file_path)
document = Document.new(lines)

if show_json
    puts document.as_hash()
    puts document.context()
else
    # Get contextual information from EDI document
    context = []
    document.context().each do |datum|
        key, value = datum.first
        context << [key, value]
    end

    # Create console message
    message = []
    message << "Successfully uploaded EDI message"
    message << "- filename: #{File.basename(file_path)}"
    message << "- message_type: #{document.type()}"
    context.each do |key, value|
        message << "- #{key}: #{value}"
    end

    # Display
    puts message
end