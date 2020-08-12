class Segment
  def pac()
    desc = pac_attr(@data[3])
    desc = pac_attr(@data[4]) unless desc
    return { "reference" => "unknown_identifier"} unless desc
    return { desc => @data[1] }
  end

  def pac_attr(code)
    return case code
      when "09" ; "returnable_pallet"
      when "201"; "pallet"
      when "PK" ; "package"
      when "SL" ; "slipsheet"
      when "CT" ; "carton"
    end
  end
end