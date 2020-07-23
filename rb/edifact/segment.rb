CONTEXTUAL_IDS = ["RFF"]

class Segment
  def initialize(str)
    @data = decontruct(str)
  end

  def decontruct(str)
    arr = str.split("+").map { |a| a.split(":") }
    return arr.flatten
  end

  def id()
    return @data.first
  end

  def context()
    return CONTEXTUAL_IDS.include?(id()) ? parse() : nil
  end

  def parse()
    return case id()
      when "UNB"; unb()
      when "UNH"; unh()
      when "BGM"; bgm()
      when "DTM"; dtm()
      when "NAD"; nad()
      when "RFF"; rff()
    else
      {}
    end 
  end
end