require './rb/include.rb'

#path = "./files/test.eancom"
path = "./files/desadv.eancom"
lines = File.readlines(path)

document = Document.new(lines)
puts document.as_hash()

#segment = Segment.new("")
#puts segment.datetime("202002151354", "203")
#puts segment.datetime("202011", "616")
#puts segment.datetime("20200101-20200215", "718")