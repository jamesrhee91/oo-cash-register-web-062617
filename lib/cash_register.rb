require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount=0)
    @discount = discount
    @total = 0
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    @items ||= []
    quantity.times {|n| @items << title}
    @last_item = price

  end

  def apply_discount
    self.total -= (@discount * 10)
    @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{total}."
  end

  def void_last_transaction
    self.total -= @last_item
  end
end

# cash_register = CashRegister.new(200)
# cash_register.add_item("mac", 1000)
#
# binding.pry
