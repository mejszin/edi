KEY_PATH = "./files/key.json"
VERSION = "v1.0.0"

def send_to_firebase(path, id, data)
    base_uri = 'https://machin-dev.firebaseio.com'
    auth_token = File.open(KEY_PATH).read
    firebase = Firebase::Client.new(base_uri, auth_token)
    response = firebase.set(path, id => data)
	return response.success?
end

def get_from_firebase(path)
    base_uri = 'https://machin-dev.firebaseio.com'
    auth_token = File.open(KEY_PATH).read
    firebase = Firebase::Client.new(base_uri, auth_token)
    return firebase.get(path).body
end

class Console
    def initialize
        @lines = get_from_firebase("edi/console/test")
        @lines = [] if @lines == nil
    end

    def add_lines(lines, type = "INFO")
        lines.each do |line|
            add_line(line, type)
        end
    end

    def add_line(line, type = "INFO")
        prefix = "[#{Time.now.strftime("%H:%M:%S")}] [Server console/#{type}]: "
        @lines.prepend(prefix + line)
        @lines = @lines[0, 16]
        success = send_to_firebase("edi/console", "test", @lines)
        #puts success ? "Uploaded successfully." : "Failed to upload."
    end

    def add_error(text)
        success = send_to_firebase("edi/error", 0, text)
        #puts success ? "Uploaded successfully." : "Failed to upload."
    end

    def clear_errors(text)
        lines = Array.new(16) { "\\" }
        success = send_to_firebase("edi/error", "test", lines)
    end

    def clear
        lines = Array.new(16) { "\\" }
        success = send_to_firebase("edi/console", "test", lines)
    end
end

#console.add_line("Starting server version #{VERSION}")

#(0...10).each do
#    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
#    id = (0...12).map { o[rand(o.length)] }.join
#    console.add_line("Validating BOL \"#{id}\"")
#    console.add_line("Uploading BOL \"#{id}\"")
#end

#(0...10).each do
#    console.add_line("Hey Joshy!")
#end

#console.add_line("This is a test message!")

#console.add_error("BOL \"12345AB\" failed to upload")
