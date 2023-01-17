class BoutiqueInventory
  def item_names
    items.map { _1[:name] }.sort
  end

  def cheap
    items.filter { cheap?(_1) }
  end

  def out_of_stock
    items.filter { out_of_stock?(_1) }
  end

  def stock_for_item(name)
    find_by_name(name)[:quantity_by_size]
  end

  def total_stock
    items.sum { _1[:quantity_by_size].values.sum }
  end

  private

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def cheap?(item)
    item[:price] < 30
  end

  def out_of_stock?(item)
    item[:quantity_by_size].empty?
  end

  def find_by_name(name)
    items.find { _1[:name] == name }
  end
end
