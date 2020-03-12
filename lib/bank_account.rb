class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    attr_writer 

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end 

    def deposit(amount)
        self.balance += amount
    end

    # def withdrawl(amount)
    #     self.balance -= amount
    # end

    def display_balance
        "Your balance is $#{@balance}."
    end 

    def valid?
        @status == "open" && @balance > 0
    end 

    def close_account
        self.status = "closed"
    end 

end
