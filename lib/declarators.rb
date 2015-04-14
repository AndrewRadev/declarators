module Declarators
  # TODO (2015-04-14) Use explicit exceptions
  # TODO (2015-04-14) Split into multiple modules

  def cached(method_name)
    # TODO (2015-04-14) Rename method safely
    # TODO (2015-04-14) Somehow, disallow calling the original method
    alias_method "original_#{method_name}", method_name

    define_method(method_name) do |*args|
      if method("original_#{method_name}").arity > 0
        raise "A 'cached' method can't take any arguments."
      end

      if not defined? "@_original_#{method_name}"
        instance_variable_set("@_original_#{method_name}", send("original_#{method_name}", *args))
      end

      instance_variable_get("@_original_#{method_name}")
    end
  end

  def abstract(method_name)
    define_method(method_name) do |*|
      raise "The method `#{method_name}` is defined as abstract in the class `#{self.class.name}`"
    end
  end
end
