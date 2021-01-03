module Accessors
	def attr_accessors_with_history(*names)
		names.each do | name |
			var_name = "@#{name}".to_sym

			define_method(name) { instance_variable_get(var_name) }
			
			define_method("#{name}=".to_sym) do |value|
				current_value = instance_variable_get(var_name)				
				history = instance_variable_get("@#{name}_history")
				
				history.nil? ? instance_variable_set("@#{name}_history", []) : history << current_value
				
				instance_variable_set(var_name, value)
			end

			define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history") }			
		end
	end

	def strong_attr_accessor(name, type)
		var_name = "@#{name}".to_sym

		define_method(name) { instance_variable_get(var_name) }

		define_method("#{name}=".to_sym) do |value|
			raise ArgumentError, "Класс значения #{value} не совпадает с #{type}" unless value.is_a?(type)
		
			instance_variable_set(var_name, value)
		end
	end
end
