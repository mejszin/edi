class Segment
  def rff()
    desc = rff_attr(@data[1])
    return { "reference" => "unknown_identifier_#{@data[1]}"} unless desc
    return { desc => @data[2] }
  end

  def rff_attr(code)
    return case @data[1]
      when "AE" ; "authorization_for_expense_number"
      when "BO" ; "blanket_order_number"
      when "CR" ; "customer_reference_number"
      when "CT" ; "contract_number"
      when "IP" ; "import_licence_number"
      when "ON" ; "buyer_order_number"
      when "PD" ; "promotion_deal_number"
      when "PL" ; "price_list_number"
      when "UC" ; "ultimate_customer_reference_number"
      when "VN" ; "supplier_order_number"
      when "AKO"; "action authorization number"
      when "ANJ"; "authorization_number"
      when "ADE"; "account_number"
      when "AMT"; "goods_and_services_tax_identification_number"
      when "YC1"; "additional_party_identification"
      when "FC" ; "fiscal_number"
      when "GN" ; "government_reference_number"
      when "IA" ; "internal_vendor_number"
      when "IT" ; "internal_customer_number"
      when "TL" ; "tax_exemption_licence_number"
      when "VA" ; "vat_registration_number"
      when "BM" ; "bill_of_lading_number"
      when "DQ" ; "delivery_note_number"
    end
  end
end