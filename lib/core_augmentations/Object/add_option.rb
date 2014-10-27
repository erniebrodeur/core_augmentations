class Object
  # Add a trackable option to an object.  Creates a method for the key name.
  def add_option(key = nil)
    if key
      @_added_options = [] unless @_added_options
      @_added_options.push(key.to_sym) unless @_added_options.include?(key.to_sym)
      define_singleton_method(key) do |args = nil|
        if !args
          instance_variable_get("@#{key}")
        else
          instance_variable_set("@#{key}", args)
        end
      end
    else
      return @_added_options
    end
  end
end
