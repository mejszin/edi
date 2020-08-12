class Segment
  def unit_ref(unit)
    return case unit
      when "CEL"; "degree celsius"
      when "KGM"; "kilogram"
      when "GRM"; "gram"
      when "CMT"; "centimeter"
      when "MMT"; "millimetre"
      when "MTK"; "square metre"
      when "AD" ; "byte"
      when "4L" ; "megabyte"
      when "MPA"; "megapascal"
    else
      "unknown_unit_#{unit}"
    end
  end
end