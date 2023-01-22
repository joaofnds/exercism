require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = items.map { OpenStruct.new _1 }
  end

  def item_names
    items.map(&:name).sort
  end

  def total_stock
    items.sum { _1.quantity_by_size.values.sum }
  end
end
