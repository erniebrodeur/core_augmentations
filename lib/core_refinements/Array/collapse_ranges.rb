class Array
  # collapse a given array into an array with ranges (and singular) entries.
  def collapse_ranges
    ungapped_array = []
  	i = 0
  	contiguous = false
  	contiguous_start = nil
  	contiguous_end = nil
  	while (i <= self.count - 1)
      return nil unless self[i].kind_of? Numeric
  		if self[i]  + 1 == self[i+1]
  			# in a sequence and we know this is a part of the range since we have a start marker
  			contiguous_start = i  unless contiguous_start
  		else
  			if contiguous_start
  				# mark our end
  				contiguous_end = i
  				# turn it into a range
  				range = self[contiguous_start]..self[contiguous_end]
  				ungapped_array.push(range)
          # clean everything up for the next range
  				contiguous_start = nil
  				contiguous_end = nil
  			else
          # normal number, just add to the output array
  				ungapped_array.push self[i]
  			end
  		end
  		i += 1
  	end
  	return ungapped_array
  end
end
