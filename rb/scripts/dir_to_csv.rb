def dir_to_csv(root_path, save_path)
    # Define array structure with header
    structure = [["Name", "Description", "Last amended"]]
    # Iterate over files in directory
    Dir.foreach(root_path) do |file_name|
        next if file_name == '.' or file_name == '..'
        # Do work on the remaining files & directories
        file_path = root_path + file_name
        description = ""
        last_amended = File.mtime(file_path)
        structure << [file_name, description, last_amended, file_path]
    end
    # Write each line as a CSV
    File.open(save_path, 'w') do |file| 
        structure.each do |line|
            file.write(line.join(",") + "\n")
        end
    end
end
