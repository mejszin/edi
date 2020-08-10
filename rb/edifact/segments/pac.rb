class Segment
  def pac()
    return case @data[3]
      when "09" ; { "returnable_pallet" => @data[1] }
      when "201"; { "pallet" => @data[1] }
      when "PK" ; { "package" => @data[1] }
      when "SL" ; { "slipsheet" => @data[1] }
      when "CT" ; { "carton" => @data[1] }
    else
      case @data[4]
        when "09" ; { "returnable_pallet" => @data[1] }
        when "201"; { "pallet" => @data[1] }
        when "PK" ; { "package" => @data[1] }
        when "SL" ; { "slipsheet" => @data[1] }
        when "CT" ; { "carton" => @data[1] }
      else
        { "reference" => "unknown_identifier"}
      end
    end
  end
end