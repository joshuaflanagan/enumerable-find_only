module EnumerableOnly
  class TooManyItems < StandardError
  end
end

Enumerable.module_eval do
  def only
    if block_given?
      already_seen = false
      result = nil
      each do |item|
        if yield(item)
          if already_seen
            raise EnumerableOnly::TooManyItems
          else
            result = item
            already_seen = true
          end
        end
      end
      result
    else
      items = take(2)
      if items.length > 1
        raise EnumerableOnly::TooManyItems
      end

      items[0]
    end
  end
end
