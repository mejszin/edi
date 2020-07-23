ENV_INFO = "envelope"
DOC_INFO = "document_information"

INDEX_ORDER = [
  ["UNB", ENV_INFO],
  ["UNH", DOC_INFO],
  ["NAD", "name"],
  ["TAX", "tax"],
  ["CUX", "currency"],
  ["PAT", "payment_terms"],
  ["TDT", "transport_details"]
]

class Document
  def initialize(lines)
    @context = Array.new
    @lines = sanitise(lines)
    @groups = chop().map { |lines| Group.new(lines) }
    # List of IDs that give context to the EDI message
  end

  def debug()
    return @groups.each { |group| puts group.as_hash, "\n" }
  end

  def type()
    hash = as_hash()
    return "unknown" unless hash.key?(DOC_INFO) && hash[DOC_INFO].key?("message")
    return hash[DOC_INFO]["message"]
  end

  def context()
    return @context.uniq
  end

  def as_hash()
    hash = {}
    @groups.each { |group| hash.merge!(group.as_hash) }
    return hash
  end

  def sanitise(lines)
    return lines.map! { |line| line.chomp.gsub("'", "") }
  end

  def chop()
    data, current_index = [], -1
    @lines.each do |line|
      segment, is_used = Segment.new(line), false
      @context << segment.context() unless (segment.context() == nil)
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