class Segment
  def cps()
    return nil
  end

  def cps_context()
    return "consignment_master" if length == 2
    return "consignment_line_" + @data[1]
  end
end