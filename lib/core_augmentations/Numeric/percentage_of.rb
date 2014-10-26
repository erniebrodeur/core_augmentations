class Numeric
	# return the percentage of a number, rounded to 2 places by default.
  def percentage_of(n, round = 2)
    return (self.to_f / n.to_f * 100.0).round(round)
  end
end