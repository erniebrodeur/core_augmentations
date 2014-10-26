class Array
  def index_by(position)
    index = {}
    self.each do |entry|
      if entry.kind_of?(Array) || entry.kind_of?(Hash)
        raise "No Entry: #{position} in entry." unless entry[position]
        raise "Duplicate Index: #{entry[position]}" if index[entry[position]]
        index[entry[position]] = entry
      end
    end

    return index
  end
end