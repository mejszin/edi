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
        @lines = get_from_firebase("edi/console")
        @lines = [] if @lines == nil
    end

    def add(line, type = "INFO")
        prefix = "[#{Time.now.strftime("%H:%M:%S")}] [Server console/#{type}]: "
        @lines.prepend(prefix + line)
        @lines = @lines[0, 16]
        success = send_to_firebase("edi", "console", @lines)
        puts success ? "Uploaded successfully." : "Failed to upload."
    end
end

console = Console.new
console.add("Starting server version #{VERSION}")
console.add("Uploading BOL \"12345AB\"")