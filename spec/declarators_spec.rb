require 'declarators'

describe Declarators do
  let(:example_class) do
    Class.new do
      extend Declarators

      # Technically, the def is not even necessary
      def abstract_method
      end
      abstract :abstract_method

      def cached_method
        Time.now.to_s + rand.to_s
      end
      cached :cached_method
    end
  end

  let(:example_instance) { example_class.new }

  describe ".cached" do
    it "caches the method call" do
      first_call  = example_instance.cached_method
      second_call = example_instance.cached_method

      first_call.should eq second_call
    end

    it "can only be used for methods without arguments" do
      klass = Class.new do
        extend Declarators
        def example(one, two); end
        cached :example
      end

      -> { klass.new.example("foo", "bar") }.should raise_error
    end

    it "returns the method name for chaining purposes" do
      result = nil
      Class.new do
        extend Declarators
        def example; end
        result = cached :example
      end

      result.should eq :example
    end
  end

  describe ".abstract" do
    it "raises an error if it's called directly" do
      -> { example_instance.abstract_method }.should raise_error
    end

    it "returns the method name for chaining purposes" do
      result = nil
      Class.new do
        extend Declarators
        result = abstract :example
      end

      result.should eq :example
    end
  end
end
