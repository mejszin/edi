class Segment
  def qty()
    desc = qty_attr(@data[1])
    return { "reference" => "unknown_reference_identifier_#{@data[1]}"} unless desc
    return { desc => @data[2] }
  end

  def qty_attr(code)
    return case code
      when "12" ; "despatch_quantity"
      when "21" ; "ordered_quantity"
      when "59" ; "number_of_consumer_units_in_the_traded_unit"
      when "61" ; "return_quantity"
      when "121"; "over_shipped"
      when "192"; "free_goods_quantity"
      when "193"; "free_quantity_included"
      when "45E"; "number_of_units_in_higher_packaging_or_configuration_level"
    end
  end
end