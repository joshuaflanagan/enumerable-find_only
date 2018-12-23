module EnumerableOnly
  class TooManyItems < StandardError
  end
end

Enumerable.module_eval do
  def only
    items = take(2)
    if items.length > 1
      raise EnumerableOnly::TooManyItems
    end

    items[0]
  end
end
