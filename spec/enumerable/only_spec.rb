require "spec_helper"

RSpec.describe EnumerableOnly do
  context "when no items are available" do
    it "returns nil" do
      expect([].only).to be_nil
    end
  end

  context "when exactly one item is available" do
    it "returns the one item" do
      expect([:item].only).to eq(:item)
    end

  end

  context "when more than one items are available" do
    it "raises TooManyItems" do
      expect{
        [:first, :second].only
      }.to raise_error(EnumerableOnly::TooManyItems)
    end

    it "does not iterate the entire list" do
      visited_items = []
      list = Enumerator.new do |yielded|
        visited_items << :a
        yielded << :a
        visited_items << :b
        yielded << :b
        visited_items << :c
        yielded << :c
      end

      expect{
        list.only
      }.to raise_error(EnumerableOnly::TooManyItems)

      expect(visited_items).to_not include(:c)
      expect(visited_items).to eq([:a, :b])
    end
  end
end
