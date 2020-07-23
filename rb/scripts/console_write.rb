require './rb/include.rb'

if ARGV.length > 0
    console = Console.new
    console.add_line(ARGV[0])
end