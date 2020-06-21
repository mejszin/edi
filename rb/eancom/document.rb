INDEX_ORDER = [
  ["UNB", "envelope"],
  ["UNH", "document_information"],
  ["NAD", "name"],
  ["TAX", "tax"],
  ["CUX", "currency"],
  ["PAT", "payment_terms"],
  ["TDT", "transport_details"]
]

class Document
  def initialize(lines)
    @lines = sanitise(lines)
    @groups = chop().map { |lines| Group.new(lines) }
  end

  def debug()
    @groups.each { |group| puts group.as_hash, "\n" }
  end

  def as_hash()
    hash = {}
    @groups.each { |group| hash.merge!(group.as_hash) }
    return hash
  end

  def sanitise(lines)
    lines.map! { |line| line.chomp.gsub("'", "") }
  end

  def chop()
    data, current_index = [], -1
    @lines.each do |line|
      segment, is_used = Segment.new(line), false
      INDEX_ORDER.each_with_index do |datum, index|
        id, desc = datum
        if (segment.id == id) && (current_index <= index )
          is_used = true
          current_index = index
          data << [line]
        end
      end
      data.last << line unless is_used
    end
    return data
  end
end