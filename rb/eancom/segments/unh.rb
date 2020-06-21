class Segment
  def unh()
    return case @data[2]
      when "AUTACK"; { "document" => "secure_authentication_and_acknowledgement_message" }
      when "APERAK"; { "document" => "application_error_and_acknowledgement_message" }
      when "BANSTA"; { "document" => "banking_status_message" }
      when "CNTCND"; { "document" => "contractual_conditions_message" }
      when "COACSU"; { "document" => "commercial_account_summary_message" }
      when "COMDIS"; { "document" => "commercial_dispute_message" }
      when "CONDRA"; { "document" => "drawing_administration_message" }
      when "CONTRL"; { "document" => "syntax_and_service_report_message" }
      when "CREMUL"; { "document" => "multiple_credit_advice_message" }
      when "DEBMUL"; { "document" => "multiple_debit_advice_message" }
      when "DELFOR"; { "document" => "delivery_schedule_message" }
      when "DESADV"; { "document" => "despatch_advice_message" }
      when "DIRDEB"; { "document" => "direct_debit_message" }
      when "FINCAN"; { "document" => "financial_cancellation_message" }
      when "FINSTA"; { "document" => "financial_statement_of_an_account_message" }
      when "GENRAL"; { "document" => "general_purpose_message" }
      when "HANMOV"; { "document" => "cargo_goods_handling_and_movement_message" }
      when "IFCSUM"; { "document" => "forwarding_and_consolidation_summary_message" }
      when "IFTMAN"; { "document" => "arrival_notice_message" }
      when "IFTMBC"; { "document" => "booking_confirmation_message" }
      when "IFTMBF"; { "document" => "firm_booking_message" }
      when "IFTMIN"; { "document" => "instruction_message" }
      when "IFTSTA"; { "document" => "international_multimodal_status_report_message" }
      when "INSDES"; { "document" => "instruction_to_despatch_message" }
      when "INVOIC"; { "document" => "invoice_message" }
      when "INVRPT"; { "document" => "inventory_report_message" }
      when "KEYMAN"; { "document" => "security_key_and_certificate_management_message" }
      when "MSCONS"; { "document" => "metered_services_consumption_report_message" }
      when "ORDCHG"; { "document" => "purchase_order_change_request_message" }
      when "ORDERS"; { "document" => "purchase_order_message" }
      when "ORDRSP"; { "document" => "purchase_order_response_message" }
      when "OSTENQ"; { "document" => "order_status_enquiry_message" }
      when "OSTRPT"; { "document" => "order_status_report_message" }
      when "PARTIN"; { "document" => "party_information_message" }
      when "PAYDUC"; { "document" => "payroll_deductions_advice_message" }
      when "PAYMUL"; { "document" => "multiple_payment_order_message" }
      when "PRICAT"; { "document" => "price_sales_catalogue_message" }
      when "PRODAT"; { "document" => "product_data_message" }
      when "PROINQ"; { "document" => "product_inquiry_message" }
      when "QALITY"; { "document" => "quality_data_message" }
      when "QUOTES"; { "document" => "quote_message" }
      when "RECADV"; { "document" => "receiving_advice_message" }
      when "REMADV"; { "document" => "remittance_advice_message" }
      when "REQOTE"; { "document" => "request_for_quote_message" }
      when "RETANN"; { "document" => "announcement_for_returns_message" }
      when "RETINS"; { "document" => "instruction_for_returns_message" }
      when "SLSFCT"; { "document" => "sales_forecast_message" }
      when "SLSRPT"; { "document" => "sales_data_report_message" }
      when "TAXCON"; { "document" => "tax_control_message" }
    else
      { "document" => "Unknown document identifier +#{@data[2]}"}
    end
  end
end