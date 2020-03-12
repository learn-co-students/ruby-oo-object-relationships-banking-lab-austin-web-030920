class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status == 'pending' && sender.valid? && receiver.valid? && sender.balance > amount
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      receiver.balance -= amount
      sender.deposit(amount)
      self.status = 'reversed'
    end

  end

end
