class Segment
  def rff()
    return case @data[1]
      when "AE" ; { "authorization_for_expense_number" => @data[2] }
      when "BO" ; { "blanket_order_number" => @data[2] }
      when "CR" ; { "customer_reference_number" => @data[2] }
      when "CT" ; { "contract_number" => @data[2] }
      when "IP" ; { "import_licence_number" => @data[2] }
      when "ON" ; { "buyer_order_number" => @data[2] }
      when "PD" ; { "promotion_deal_number" => @data[2] }
      when "PL" ; { "price_list_number" => @data[2] }
      when "UC" ; { "ultimate_customer_reference_number" => @data[2] }
      when "VN" ; { "supplier_order_number" => @data[2] }
      when "AKO"; { "action authorization number" => @data[2] }
      when "ANJ"; { "authorization_number" => @data[2] }
      when "ADE"; { "account_number" => @data[2] }
      when "AMT"; { "goods_and_services_tax_identification_number" => @data[2] }
      when "YC1"; { "additional_party_identification" => @data[2] }
      when "FC" ; { "fiscal_number" => @data[2] }
      when "GN" ; { "government_reference_number" => @data[2] }
      when "IA" ; { "internal_vendor_number" => @data[2] }
      when "IT" ; { "internal_customer_number" => @data[2] }
      when "TL" ; { "tax_exemption_licence_number" => @data[2] }
      when "VA" ; { "vat_registration_number" => @data[2] }
      when "BM" ; { "bill_of_lading_number" => @data[2] }
      when "DQ" ; { "delivery_note_number" => @data[2] }
    else
      { "reference" => "unknown_reference_identifier_#{@data[1]}"}
    end
  end
end