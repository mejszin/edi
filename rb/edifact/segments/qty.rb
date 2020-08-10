class Segment
  def qty()
    return case @data[1]
      when "12" ; { "despatch_quantity" => @data[2] }
      when "21" ; { "ordered_quantity" => @data[2] }
      when "59" ; { "number_of_consumer_units_in_the_traded_unit" => @data[2] }
      when "61" ; { "return_quantity" => @data[2] }
      when "121"; { "over_shipped" => @data[2] }
      when "192"; { "free_goods_quantity" => @data[2] }
      when "193"; { "free_quantity_included" => @data[2] }
      when "45E"; { "number_of_units_in_higher_packaging_or_configuration_level" => @data[2] }
    else
      { "reference" => "unknown_reference_identifier_#{@data[1]}"}
    end
  end
end