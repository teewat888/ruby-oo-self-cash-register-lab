class CashRegister
    attr_accessor :total, :discount, :items, :last_trans
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item,price,qty = 1)
        self.total += price*qty
        qty.times {self.items << item}
        self.last_trans = {:item => item, :price => price, :qty => qty}
    end

    def apply_discount
        if self.discount != 0
            self.total = self.total * (100-self.discount)/100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if self.total != 0
            self.total -= self.last_trans[:price]*self.last_trans[:qty]
            self.last_trans[:qty].times {self.items.pop}
        end
    end
end
