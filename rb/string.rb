class String
  def as_key
    return self.downcase.gsub(" ", "_")
  end
end