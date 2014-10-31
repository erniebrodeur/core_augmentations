module CoreRefinements
  module Array
    module IndexBy
      refine ::Array do
        def index_by(position)
          index = {}
          self.each do |entry|
            if entry.kind_of?(::Array) || entry.kind_of?(Hash)
              return nil unless entry[position]
              return nil if index[entry[position]]
              index[entry[position]] = entry
            end
          end

          return index
        end
      end
    end
  end
end
