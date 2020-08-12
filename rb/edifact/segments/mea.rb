class Segment
  def mea()
    if @data[1] == "PD"
      return case @data[2]
        when "AAA"; { "unit_net_weight" => [@data[4], unit_ref(@data[3])] }
        when "AAB"; { "unit_gross_weight" => [@data[4], unit_ref(@data[3])] }
        when "ACG"; { "chargeable_weight" => [@data[4], unit_ref(@data[3])] }
        when "DN" ; { "density" => [@data[4], unit_ref(@data[3])] }
        when "HT" ; { "height" => [@data[4], unit_ref(@data[3])] }
        when "LN" ; { "length" => [@data[4], unit_ref(@data[3])] }
        when "WD" ; { "width" => [@data[4], unit_ref(@data[3])] }
      else
        { "dimension_reference" => "unknown_identifier_#{@data[2]}"}
      end
    else
      return { "dimension_reference" => "unknown_identifier_#{@data[1]}"}
    end
  end
end