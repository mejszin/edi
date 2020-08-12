CONTEXTUAL_IDS = ["RFF"]

class Segment
  attr_accessor :raw

  def initialize(str)
    @raw = str
    @data = decontruct(str)
  end

  def decontruct(str)
    arr = str.split("+").map { |a| a == "" ? [a] : a.split(":") }
    return arr.flatten
  end

  def id()
    return @data.first
  end

  def length()
    return @data.length
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
      when "LIN"; lin()
      when "QTY"; qty()
      when "PAC"; pac()
      when "MEA"; mea()
    else
      {}
    end 
  end
end