class Segment
  def mea()
    if @data[1] == "PD"
      desc = mea_attr(@data[2])
      return { "dimension_reference" => "unknown_identifier_#{@data[2]}"} unless desc
      return { desc => [@data[4], unit_ref(@data[3])] }
    end
  end

  def mea_attr(code)
    return case code
      when "AAA"; "unit_net_weight"
      when "AAB"; "unit_gross_weight"
      when "ACG"; "chargeable_weight"
      when "DN" ; "density"
      when "HT" ; "height"
      when "LN" ; "length"
      when "WD" ; "width"
    end
  end
end