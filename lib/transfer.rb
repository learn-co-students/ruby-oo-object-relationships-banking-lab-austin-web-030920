require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
   if self.status == "pending" && self.valid? && self.sender.balance > self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
   else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end 
end
