require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :receiver, :sender, :amount

  def initialize(sender, receiver, amount)
    @receiver = receiver 
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    (self.sender.valid? && self.receiver.valid?)
  end

  def execute_transaction
    if valid? && sender.balance > amount && status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
