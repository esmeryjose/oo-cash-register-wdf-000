require 'pry'
class CashRegister
  attr_accessor :total, :discount


  def initialize(discount=0)
    @total = 0
    @transactions = []
    @title_list = []
    @discount = discount
  end

  def add_item(title,price,quantity = 1)
    c = 0
    self.total += price*quantity
    @transactions << price*quantity
    while c<quantity
      @title_list << title
      c+=1
    end
  end

  def apply_discount
    if discount != 0
      last = @transactions[-1]
      discount_amount = (last*self.discount)/100
      self.total = self.total - discount_amount
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @title_list
  end

  def void_last_transaction
    # self.total =
    @total = @total - @transactions.last
  end
end
