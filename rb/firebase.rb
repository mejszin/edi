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
console.add("Added file 1.")
console.add("Added file 2.")
console.add("Added file 3.")
console.add("Added file 4.")
console.add("Added file 5.")
console.add("Added file 6.")
console.add("Added file 7.")
console.add("Added file 8.")
console.add("Added file 9.")
console.add("Added file 10.")
console.add("Added file 11.")
console.add("Added file 12.")
console.add("Added file 13.")
console.add("Added file 14.")
console.add("Added file 15.")
console.add("Added file 16.")
console.add("Added file 17.")
console.add("Added file 18.")
console.add("Added file 19.")
console.add("Added file 20.")