class Segment
  def bgm()
    desc = bgm_attr(@data[1])
    return { "document" => "unknown_identifier_+#{@data[1]}"} unless desc
    return { "message" => desc }
  end

  def bgm_attr(code)
    return case @data[1]
      when "220"; "order"
      when "221"; "blanket_order"
      when "224"; "rush_order"
      when "225"; "repair_order"
      when "226"; "call_off_order"
      when "227"; "consignment_order"
      when "22E"; "manufacturer_raised_order"
      when "23E"; "manufacturer_raised_consignment_order"
      when "258"; "standing_order"
      when "237"; "cross_docking_services_order"
      when "400"; "exceptional_order"
      when "401"; "transshipment_order"
      when "402"; "cross_docking_order"
      when "345"; "ready_for_despatch_advice"
      when "351"; "despatch_advice"
      when "35E"; "returns_advice"
      when "YA5"; "intermediate_handling_cross_docking_despatch_advice"
      when "YA6"; "prepacked_cross_docking_despatch_advice"
      when "YA7"; "consignment_despatch_advice"
      when "YB3"; "ready_for_transshipment_despatch_advice"
    end
  end
end