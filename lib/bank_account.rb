class BankAccount

    attr_reader :name
    attr_accessor :status, :balance

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def deposit(input)
        self.balance += input  
    end

    def display_balance
        return "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == 'open' && self.balance > 0
            return true
        else
            return false
        end
    end

    def close_account
        self.status = 'closed'
    end
end
