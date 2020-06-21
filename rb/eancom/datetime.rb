class Segment
  def datetime(str, format_code)
    # 102 = CCYYMMDD
    if format_code == "102"
      year   = str[ 0, 4]
      month  = str[ 4, 2]
      day    = str[ 6, 2]
      return "#{day}/#{month}/#{year}"
    end
    # 203 = CCYYMMDDHHMM
    if format_code == "203"
      year   = str[ 0, 4]
      month  = str[ 4, 2]
      day    = str[ 6, 2]
      hour   = str[ 8, 2]
      minute = str[10, 2]
      return "#{hour}:#{minute} #{day}/#{month}/#{year}"
    end
    # 616 = CCYYWW
    if format_code == "616"
      year   = str[ 0, 4]
      week   = str[ 4, 2]
      return "#{week} #{year}"
    end
    # 718 = CCYYMMDD-CCYYMMDD
    if format_code == "718"
      date_a = datetime(str[ 0, 8], "102")
      date_b = datetime(str[ 9, 8], "102")
      return "#{date_a} - #{date_b}"
    end
    # Else
    return str
  end
end