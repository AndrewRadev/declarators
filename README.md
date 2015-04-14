A simple library that contains useful decorators for ruby methods. The
(possibly temporary) name is a play on "declarative" and "decorators". Very
simple, mostly just a fun experiment in metaprogramming.

Example:

``` ruby
class BaseParser
  def initialize(text)
    @text = text
  end

  # The `run` method is abstract in this base class. It only serves to document
  # the interface and raises an error when called.
  #
  abstract def run
  end
end

class RealParser < BaseParser
  # The `run` method is invoked only once and from that point on, keeps
  # returning the same state. Basically, a `||=`, except uses `defined?`, so it
  # works for falsey values as well.
  #
  cached def run
    # ...
  end
end
```
