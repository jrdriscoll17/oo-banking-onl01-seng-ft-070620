class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !sender.valid? || sender.balance > @amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    end
    # if sender.valid? && self.status != "complete" && self.status != "rejected"
    #   sender.balance -= @amount
    #   receiver.balance += @amount
    #   self.status = "complete"
    # else
    #   self.status = "rejected"
    #   "Transaction rejected. Please check your account balance."
    # end
  end
end
