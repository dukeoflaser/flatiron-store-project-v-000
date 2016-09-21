class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.items.map(&:price).inject(0, :+)
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id)

    if line_item.nil?
      LineItem.new(item_id: item_id, cart_id: self.id)
    else
      line_item
    end
  end
end
