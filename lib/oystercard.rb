class Oystercard
    MAXBALANCE = 90
    attr_reader :balance
    def initialize
        @balance = 0
    end  
    
    def top_up(top_up_amount)
        raise "Max balance of #{MAXBALANCE} exceeded" if @balance + top_up_amount > MAXBALANCE
        @balance += top_up_amount
    end
    
    
end