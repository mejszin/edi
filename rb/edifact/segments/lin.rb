class Segment
  def lin()
    return {} if length < 3
    return { "gtin" => @data[length - 2] }
  end
end