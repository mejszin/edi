require "./rb/scripts/dir_to_csv.rb"
require "./rb/scripts/csv_to_html.rb"

root_path = "docs/public/"
save_path = "docs/public.csv"
html_path = "public_docs.html"

if ARGV.length == 0
    dir_to_csv(root_path, save_path)
    csv_to_html(save_path, html_path, "Public documentation")
    puts "Created \"#{html_path}\"."
elsif ARGV[0] == "refresh"
    csv_to_html(save_path, html_path, "Public documentation")
    puts "Refreshed \"#{html_path}\"."
end