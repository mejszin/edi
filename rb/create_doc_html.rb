require "./rb/dir_to_csv.rb"
require "./rb/csv_to_html.rb"

root_path = "files/docs/"
save_path = "files/external_documentation.csv"
html_path = "external_docs.html"

if ARGV.length == 0
    dir_to_csv(root_path, save_path)
    csv_to_html(save_path, html_path, "External documentation")
    puts "Created \"#{html_path}\"."
elsif ARGV[0] == "refresh"
    csv_to_html(save_path, html_path, "External documentation")
    puts "Refreshed \"#{html_path}\"."
end