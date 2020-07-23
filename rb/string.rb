class String
  def titleize
    return split(/(\W)/).map(&:capitalize).join
  end

  def as_key
    return self.downcase.gsub(" ", "_")
  end

  def un_key
    return self.gsub("_", " ").titleize
  end
end