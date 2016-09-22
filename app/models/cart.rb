class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    prices = self.line_items.map do |line_item|
      Item.find(line_item.item_id).price * line_item.quantity
    end

    prices.inject(0, :+)
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)

    if line_item.nil?
      line_item = self.line_items.new(item_id: item_id, cart_id: self.id)
    else
      line_item.quantity += 1
      line_item.save
    end

    line_item
  end

  def update_inventory
    self.line_items.each do |line_item|
      item = Item.find(line_item.id)
      item.update(inventory: (item.inventory - line_item.quantity))
    end
  end
end
