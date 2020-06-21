class Segment
  def nad()
    if @data[3] == ""
      return { "gln" => @data[2] }
    else
      return { "gln" => @data[2], "address" => @data[3] }
    end
  end

  def nad_context()
    return case @data[1]
      when "BY"; "buyer"
      when "CO"; "corporate office"
      when "DP"; "delivery_party"
      when "IV"; "invoicee"
      when "SN"; "store_number"
      when "SR"; "supplier_representative"
      when "SU"; "supplier"
      when "WH"; "warehouse_keeper"
      when "SH"; "shipper"
    else
      "unknown_name_identifier_#{@data[1]}"
    end
  end
end