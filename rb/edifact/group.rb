class Group
  attr_accessor :segments, :context

  def initialize(lines)
    @segments = lines.map { |line| Segment.new(line) }
    @context = context()
  end

  def context()
    context = "unknown_context_#{@segments.first.id}"
    case @segments.first.id
      when "NAD"; context = @segments.first.nad_context()
      when "CPS"; context = @segments.first.cps_context()
    else
      INDEX_ORDER.each { |id, desc| context = desc if id == @segments.first.id }
    end
    return context
  end

  def as_hash()
    hash = {}
    @segments.each { |segment| hash.merge!(segment.parse) }
    return { @context => hash }
  end
end