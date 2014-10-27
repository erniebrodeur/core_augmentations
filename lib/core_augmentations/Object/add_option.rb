class Object
  # Add a trackable option to an object.  Creates a method for the key name.
  def add_option(key)
    define_singleton_method(key) do |args = nil|
      if !args
        instance_variable_get("@#{key}")
      else
        instance_variable_set("@#{key}", args)
      end
    end
  end
end
