class String
  # take a CamelCase or under_scored string and convert it to a human readable string (useful for output).
  def to_human
    return self.split("_").map {|word| word[0] + word[1..-1]}.join(" ").capitalize if self.include?("_")

    return self.split(/(?=[A-Z])/).join(" ").capitalize
  end
end
