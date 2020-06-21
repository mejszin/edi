class Segment
  def bgm()
    return case @data[1]
      when "220"; { "message" => "order" }
      when "221"; { "message" => "blanket_order" }
      when "224"; { "message" => "rush_order" }
      when "225"; { "message" => "repair_order" }
      when "226"; { "message" => "call_off_order" }
      when "227"; { "message" => "consignment_order" }
      when "22E"; { "message" => "manufacturer_raised_order" }
      when "23E"; { "message" => "manufacturer_raised_consignment_order" }
      when "258"; { "message" => "standing_order" }
      when "237"; { "message" => "cross_docking_services_order" }
      when "400"; { "message" => "exceptional_order" }
      when "401"; { "message" => "transshipment_order" }
      when "402"; { "message" => "cross_docking_order" }
      when "345"; { "message" => "ready_for_despatch_advice" }
      when "351"; { "message" => "despatch_advice" }
      when "35E"; { "message" => "returns_advice" }
      when "YA5"; { "message" => "intermediate_handling_cross_docking_despatch_advice" }
      when "YA6"; { "message" => "prepacked_cross_docking_despatch_advice" }
      when "YA7"; { "message" => "consignment_despatch_advice" }
      when "YB3"; { "message" => "ready_for_transshipment_despatch_advice" }
    else
      { "document" => "Unknown identifier +#{@data[1]}"}
    end
  end
end