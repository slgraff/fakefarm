class Player
  [:name, :score, :paddle].each do |attr_nane|
    define_method("#{attr_name}=") do |value|
      instance_variable_set("@#{attr_name}", value)
      end

      define_method(attr_name) do
        instance_variable_get("@#{attr_name}")
    end
  end
end


class Player
  [:name, :score, :paddle].each do |attr_nane|
    class_eval <<-MET, __FILE__, __LINE__
    def #{attr_name}=(value)
      @#{attr_name} = value
    end

    MET

      define_method(attr_name) do
        instance_variable_get("@#{attr_name}")
    end
  end
end


module Settings
  def setting(name)
    class_eval <<-MET, __FILE__, __LINE__
    def #{name}_on
      @#{name}_on = true
    end

    def #{name}_off
      @#{name}_on = false
    end
    MET
  end
end

