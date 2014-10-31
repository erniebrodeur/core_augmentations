module CoreRefinements
  module Object
    module Options
      refine ::Object do
        # Add a trackable option to an object.  Creates a method for the key name.
        def add_option(key = nil)
          @_added_options ||= []
          @_added_options.push(key.to_sym) unless @_added_options.include?(key.to_sym)
          define_singleton_method(key) do |args = nil|
            if !args
              instance_variable_get("@#{key}")
            else
              instance_variable_set("@#{key}", args)
            end
          end
        end

        def list_options
          return @_added_options ||= nil
        end
      end
    end
  end
end
