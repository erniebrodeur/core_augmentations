module CoreRefinements
  module Array
    module CollapseRanges
      refine ::Array do
        # collapse a given array into an array with ranges (and singular) entries.
        def collapse_ranges(split: false, step: 1)
          ungapped_array = []
        	i = 0
        	contiguous = false
        	contiguous_start = nil
        	contiguous_end = nil
        	while (i < self.count)
            current_n = self[i]
            return nil unless current_n.kind_of? Numeric

            next_n = self[i+1]
            if next_n && current_n != next_n && Range.new(current_n, current_n + step).include?(next_n)
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
        				ungapped_array.push current_n
        			end
        		end
        		i += 1
        	end

          if split && ungapped_array.any?
            return [ungapped_array.select {|i| i.class == Range},
                    ungapped_array.select {|i| i.kind_of? Numeric}]
          end
        	return ungapped_array
        end
      end
    end
  end
end
